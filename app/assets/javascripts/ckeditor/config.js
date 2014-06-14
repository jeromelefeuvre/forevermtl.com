CKEDITOR.editorConfig = function( config )
{
  config.toolbar = 'Mini';

  config.toolbar_Mini =
    [
      { name: 'document', items : [ 'NewPage','Preview' ] },
      { name: 'styles', items : [ 'Styles','Format' ] },
      { name: 'basicstyles', items : [ 'Bold','Italic','Strike','-','RemoveFormat' ] },
      { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote' ] },
      { name: 'links', items : [ 'Link','Unlink','Anchor' ] },
      { name: 'tools', items : [ 'Maximize','-','About' ] }    ];
};