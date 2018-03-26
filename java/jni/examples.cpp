
// --- Create Java object

// V1
jclass objectCls = env->FindClass("org.home.model.Box");
jmethodID objectConstructor = env->GetMethodID(objectCls, "<init>", "()V");
jobject resultObject = env->NewObject(objectCls, objectConstructor);

jint widthVal = 25;
jfieldID widthId = env->GetFieldID(objectCls, "width", "I");
env->SetIntField(resultObject, widthId, widthVal);

jstring textVal = env->NewStringUTF("123");
jfieldID textId = env->GetFieldID(objectCls, "text", "Ljava/lang/String;");
env->SetObjectField(resultObject, textId, textVal);


// V2
jclass objectCls = env->FindClass("org.home.model.Box");
jmethodID objectConstructor = env->GetMethodID(objectCls, "<init>", "()V");
jobject resultObject = env->NewObject(objectCls, objectConstructor);

jint widthVal = 25;
jmethodID setWidthID = env->GetMethodID(objectCls, "setWidth", "(I)V");
env->CallVoidMethod(resultObject, setWidthID, widthVal);

jbyteArray textBytes = NULL;
jmethodID setTextID = env->GetMethodID(objectCls, "setText", "([B)V");
env->CallVoidMethod(resultObject, setTextID, textBytes);

jstring textVal = env->NewStringUTF("123");
jmethodID setTextID = env->GetMethodID(objectCls, "setText", "(Ljava/lang/String;)V");
env->CallVoidMethod(resultObject, setTextID, textVal);
