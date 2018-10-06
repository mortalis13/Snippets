javascript:(function(){
  document.querySelector('[data-control-name="add_accomplishment"]').click();
  document.querySelector('[data-control-name="add_project"]').click();
})()

javascript:(function(){
  document.querySelector('[data-control-name="accomplishments_expand_projects"]').click();
  document.querySelector('[data-control-name="add_accomplishment"]').scrollIntoView(true);
  document.querySelector('button[aria-controls="projects-accomplishment-list"]').click();
})()

javascript:(function(){
  document.querySelector('[data-control-name="accomplishments_expand_projects"]').scrollIntoView();
})()

