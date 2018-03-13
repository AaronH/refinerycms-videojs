window.onload = function ()
{
    if ($('video').is('*')) {
        $('body').append('<link href="//vjs.zencdn.net/5.19/video-js.min.css" rel="stylesheet">');
        $('body').append('<script src="//vjs.zencdn.net/5.19/video.min.js"></script>');
    }
};