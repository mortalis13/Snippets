#define LOG_MODULE_NAME "_ClassNative"

#include <jni.h>

#include <string>

#include "log.h"

#ifdef __cplusplus
extern "C" {
#endif

using namespace std;


static JavaVM* gvm;
static jclass MainClassRef;
static jmethodID NotifyMethodID;

static Worker worker;


bool GetJniEnv(JavaVM *vm, JNIEnv **env) {
  LOGD("GetJniEnv()");
  if (!vm) {
    LOGE("VM instance is NULL");
    return false;
  }
  
  bool thread_attached = false;
  *env = nullptr;

  // Check if the current thread is attached to the VM
  auto get_env_result = vm->GetEnv((void**)env, JNI_VERSION_1_6);
  if (get_env_result == JNI_EDETACHED) {
    if (vm->AttachCurrentThread(env, NULL) == JNI_OK) {
      thread_attached = true;
    }
    else {
      LOGE("Failed to attach thread");
    }
  }
  else if (get_env_result == JNI_EVERSION) {
    LOGE("Unsupported JNI version");
  }
  
  return thread_attached;
}

JNIEXPORT jint JNI_OnLoad(JavaVM* pVM, void* reserved) {
  LOGD("JNI_OnLoad()");
  gvm = pVM;
  return JNI_VERSION_1_6;
}

// Call Java static method from another thread
void notifyChange() {
  // --> Some thread
  JNIEnv *env;
  
  // Attach the thread to env first
  bool thread_attached = GetJniEnv(gvm, &env);
  LOGI("JNI env attached to the current thread: %d", thread_attached);
  
  if (thread_attached) {
    if (MainClassRef && NotifyMethodID) {
      env->CallStaticVoidMethod(MainClassRef, NotifyMethodID);
    }
    gvm->DetachCurrentThread();
  }
}

JNIEXPORT void JNICALL Java_org_test_ClassNative_init(JNIEnv *env, jclass obj) {
  LOGD(__func__);
  if (!MainClassRef) {
    MainClassRef = (jclass) env->NewGlobalRef(obj);
    NotifyMethodID = env->GetStaticMethodID(MainClassRef, "notifyChange", "()V");
  }
}


JNIEXPORT void JNICALL Java_org_test_pass_string(JNIEnv *env, jclass obj, jstring jpath) {
  LOGD(__func__);
  const char* bytes = env->GetStringUTFChars(jpath, 0);
  string path(bytes);
  env->ReleaseStringUTFChars(jpath, bytes);
  LOGI("path: %s", path.c_str());
}


JNIEXPORT jstring JNICALL Java_org_test_return_string(JNIEnv *env, jclass obj) {
  string path = "";
  return env->NewStringUTF(path.c_str());
}


JNIEXPORT void JNICALL Java_org_test_create_object(JNIEnv *env, jclass obj) {
  jclass resultClass = env->FindClass("org/test/A");
  jmethodID constructor = env->GetMethodID(resultClass, "<init>", "()V");
  jobject resultObject = env->NewObject(resultClass, constructor);
}


JNIEXPORT void JNICALL Java_org_test_set_object_array_field(JNIEnv *env, jclass obj) {
  jclass resultClass = (env)->FindClass("org/mortalis/homeplayer/decoder/DecoderResult");
  jmethodID constructor = (env)->GetMethodID(resultClass, "<init>", "()V");
  jobject resultObject = (env)->NewObject(resultClass, constructor);
  
  jfieldID fieldID = (env)->GetFieldID(resultClass, "data", "[S");
  
  int size = 100;
  jshortArray array = env->NewShortArray(size);
  
  jshort* pArray = env->GetShortArrayElements(array, NULL);
  for (size_t i = 0; i < size; i++) {
    pArray[i] = 0;
  }
  env->ReleaseShortArrayElements(array, pArray, 0);
  
  env->SetObjectField(resultObject, fieldID, array);
}


#ifdef __cplusplus
}
#endif
