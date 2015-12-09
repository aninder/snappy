(function(b,j){function x(a){var b,d,f,n={};if(j.getComputedStyle)if(a=j.getComputedStyle(a,null),a.length){d=0;for(f=a.length;d<f;d++)b=a[d].replace(/\-([a-z])/,function(a,b){return b.toUpperCase()}),n[b]=a.getPropertyValue(a[d])}else for(b in a)"function"!==typeof a[b]&&"length"!==b&&(n[b]=a[b]);else for(b in a=a.currentStyle||a.style,a)Object.prototype.hasOwnProperty.call(a,b)&&(n[b]=a[b]);return n}function H(){this.pos=this.domNode=this.character=null;this.visited=this.inserted=this.used=!1}function A(){this.str=
    "";this.characterList=[]}var q,I=1E3,J=500,K=2E3,L=2E3,M="textualizer.changed";A.prototype={use:function(a){var c=null;b.each(this.characterList,function(){if(this.character===a&&!this.used)return this.used=!0,c=this,!1});return c},reset:function(){b.each(this.characterList,function(){this.used=this.inserted=!1})}};q=function(a,c,d){function f(a){var c=b.fn.textualizer.effects,f="random"===d.effect?c[Math.floor(Math.random()*(c.length-2))+1][1]:s,e=b.Deferred(),g=[];b.each(a.characterList,function(a,
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           d){if(!d.inserted){d.domNode.css({left:d.pos.left,top:d.pos.top});var c=b.Deferred();j.setTimeout(function(){f({item:d,container:h,dfd:c})},Math.random()*K);g.push(c)}});b.when.apply(null,g).done(function(){e.resolve()});return e.promise()}function n(){e===t.length-1&&(b.each(u,function(a,b){b.reset()}),e=-1,d.loop||G.pause());e++;q(e)}function q(c){if(!y){var e=b.Deferred(),o=u[c];if(!o){var h=[],g=new A,k,i,r,m;g.str=t[c];u.push(g);k=0;for(m=g.str.length;k<m;k++)i=g.str.charAt(k),""===i?l.append(" "):
    (r=new H,r.character=i,r.domNode=b("<span/>").text(i),l.append(r.domNode),h.push(r));var s=d.centered?(z-l.height())/2:0;b.each(h,function(a,b){b.pos=b.domNode.position();b.domNode=b.domNode.clone();b.pos.top+=s;b.domNode.css({left:b.pos.left,top:b.pos.top,position:"absolute"});g.characterList.push(b)});l.html("");o=g}if(v){var h=v,x=o,B=[],C=[],D=b.Deferred(),E,p;k=[function(a){p=b.Deferred();a.animate({top:F.bottom,opacity:"hide"},p.resolve);return p.promise()},function(a){p=b.Deferred();a.fadeOut(1E3,
    p.resolve);return p.promise()}];E=k[Math.floor(Math.random()*k.length)];var w;b.each(h.characterList,function(a,d){if(w=x.use(d.character))w.domNode=d.domNode,w.inserted=!0,B.push(w);else{var c=b.Deferred();C.push(c);E(d.domNode.delay(Math.random()*L)).done(function(){d.domNode.remove();c.resolve()})}});b.when.apply(null,C).done(function(){return D.resolve(B)});D.promise().done(function(a){var c=o,g=b.Deferred(),h=[];j.setTimeout(function(){b.each(a,function(a,c){var e=b.Deferred();c.domNode.animate({left:c.pos.left,
    top:c.pos.top},d.rearrangeDuration,e.resolve);h.push(e.promise())});b.when.apply(null,h).done(function(){j.setTimeout(function(){f(c).done(function(){g.resolve()})},J)})},I);g.promise().done(function(){e.resolve()})})}else f(o).done(function(){e.resolve()});v=o;e.promise().done(function(){a.trigger(M,{index:c});j.setTimeout(n,d.duration)})}}var G=this,t=[],u,e,v,s=null,i=!1,y=!1,z,F,m,h,l;"random"!==d.effect&&b.each(b.fn.textualizer.effects,function(){if(this[0]===d.effect)return s=this[1],!1});m=
    a.clone().removeAttr("id").appendTo(j.document.body);m.css(x(a[0]));m.css({position:"absolute",top:"-1000px"});l=b("<div />").css({position:"relative",visibility:"hidden"}).appendTo(m);a.css("overflow","hidden");h=b("<div />").css("position","relative").appendTo(a);z=a.height();F={bottom:z};this.data=function(a){this.stop();t=a;u=[]};this.stop=function(){this.pause();i=!1;v=null;e=0;h.empty();l.empty()};this.pause=function(){y=!0;i=!1};this.start=function(){0===t.length||i||(e=e||0,i=!0,y=!1,q(e))};
    this.destroy=function(){h.parent().removeData("textualizer").end().remove();l.remove()};c&&c instanceof Array&&this.data(c)};b.fn.textualizer=function(){var a=arguments,c,d,f;f=this.data("textualizer");f||(c=[],1===a.length&&a[0]instanceof Array?c=a[0]:1===a.length&&"object"===typeof a[0]?d=a[0]:2===a.length&&(c=a[0],d=a[1]),0===c.length&&this.find("p").each(function(){c.push(b(this).text())}),this.html(""),f=new q(this,c,b.extend({},b.fn.textualizer.defaults,d)),this.data("textualizer",f));d=f;"string"===
typeof a[0]&&d[a[0]]&&d[a[0]].apply(d,Array.prototype.slice.call(a,1));return this};b.fn.textualizer.defaults={effect:"random",duration:2E3,rearrangeDuration:1E3,centered:!1,loop:!0};b.fn.textualizer.effects=[["none",function(a){a.container.append(a.item.domNode.show())}],["fadeIn",function(a){a.container.append(a.item.domNode.fadeIn(2E3,a.dfd.resolve));return a.dfd.promise()}],["slideLeft",function(a){a.item.domNode.appendTo(a.container).css({left:-1E3}).show().animate({left:a.item.pos.left},2E3,
    a.dfd.resolve);return a.dfd.promise()}],["slideTop",function(a){a.item.domNode.appendTo(a.container).css({top:-1E3}).show().animate({top:a.item.pos.top},2E3,a.dfd.resolve);return a.dfd.promise()}]]})(jQuery,window);

(function($) {
    $.fn.rainbow = function(options) {
        this.each(function() {

            options.originalText = $(this).html();
            options.iterations = 0;
            if (!options.pauseLength) {
                options.pauseLength = options.animateInterval;
            }
            $(this).data('options',options);

            if (options.pad) {

                for (x = 0; x < options.originalText.length; x++) {
                    options.colors.unshift(options.colors[options.colors.length-1]);
                }
            }

            $.fn.rainbow.render(this);

        });
    }

    $.fn.pauseRainbow = function() {
        this.each(function() {
            var options = $(this).data('options');
            if (options) {
                options.animate = false;
                $(this).data('options',options);
            }
        });
    }


    $.fn.resumeRainbow = function() {
        this.each(function() {
            var options = $(this).data('options');
            if (options) {
                options.animate = true;
                $(this).data('options',options);
                $.fn.rainbow.render(this);
            }
        });
    }


    $.fn.rainbow.render = function(obj) {

        var options = $(obj).data('options');
        var chars = options.originalText.split('');

        options.iterations++;

        var newstr = '';
        var counter = 0;
        for (var x in chars) {

            if (chars[x]!=' ') {
                newstr = newstr + '<span style="color: ' + options.colors[counter] + ';">' + chars[x] + '</span>';
                counter++;
            } else {
                newstr = newstr + ' ';

            }


            if (counter >= options.colors.length) {
                counter = 0;
            }
        }
        $(obj).html(newstr);

        var pause = (options.iterations % options.colors.length == 0);



        if (options.animate) {

            (
                function(obj,interval) {
                    var options = $(obj).data('options');
                    var i = setTimeout(function() {
                        $.fn.rainbow.shift(obj);
                    },interval);
                    options.interval = i;
                    $(obj).data('options',options);
                }
            )(obj,pause?options.pauseLength:options.animateInterval);
        }


    }


    $.fn.rainbow.shift = function(obj) {

        var options = $(obj).data('options');
        var color = options.colors.pop();
        options.colors.unshift(color);
        $.fn.rainbow.render(obj);

    }

})(jQuery);


(function( $ ) {
    $('head').append('\
    <style>\
    .typist-container {\
      overflow: hidden;\
      padding-left: 4px;\
    }\
    .typist-container p {\
      margin: 0 0 3px;\
    }\
    .typist-container p.prompt {\
      margin: 5px 0;\
    }\
    </style>');

    var MAX_SCROLL = 999999999;
    var defaults = {
        backgroundColor: '#333',
        textColor: '#DDD',
        fontFamily: 'monospace',
        height: 300
    };
    var $el, typeDelay = 80;


    var blinkTimer;
    var startBlink = function(next) {
        blinkTimer = setInterval(function() {
            $('.cursor').toggle();
        }, 500);
        next && next();
    };

    var stopBlink = function(next) {
        clearInterval(blinkTimer);
        next && next();
    };

    var addLine = function() {
        $('.cursor').remove();
        var p = $('<p>&nbsp;</p>');
        $el.append(p);
        var height = 0;
        $el.children().each(function() {
            height += $(this).height();
        });
        $el.scrollTop(height);
        return p;
    };

    var methods = {

        init: function(config) {
            config = $.extend(defaults, config);

            $el = this;

            var oldStyle = $el.attr('style') + ';' || '';
            var style = 'background-color: ' + config.backgroundColor;
            style += '; color: ' + config.textColor;
            style += '; font-family: ' + config.fontFamily;

            $el.addClass('typist-container')
                .attr('style', oldStyle + style)
                .height(config.height);

            startBlink();

            return $el;
        },
        prompt: function() {
            return $el.queue(function(next) {
                $('.cursor').remove();
                addLine()
                    .addClass('prompt')
                    .html('$ <span class="cursor">|</span>');
                next();
            });
        },
        type: function(text) {
            $el.queue(stopBlink);
            var typeChar = function(index) {
                $el.queue(function(next) {
                    $('.cursor').before(text[index]);
                    next();
                })
                    .delay(typeDelay);
            };
            for (var i = 0; i < text.length; i++) {
                typeChar(i);
            }
            return $el.queue(startBlink);
        },
        echo: function(text) {
            var $p;
            var typeChar = function(index) {
                $el.queue(function(next) {
                    if (index === 0) {
                        $p = addLine();
                    }

                    $p.append(text[index]);
                    next();
                })
                    .delay(typeDelay);
            };
            for (var i = 0; i < text.length; i++) {
                typeChar(i);
            }
            return $el;
        },
        wait: function(millis) {
            return $el.delay(millis);
        },
        speed: function(speed) {
            if (speed === 'fast') {
                typeDelay = 20;
            }
            else if (speed === 'slow') {
                typeDelay = 120;
            }
            return $el;
        }
    };

    $.fn.typist = function(method) {
        // Method calling logic
        if ( methods[method] ) {
            return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));
        } else if ( typeof method === 'object' || ! method ) {
            return methods.init.apply( this, arguments );
        } else {
            $.error( 'Method ' +  method + ' does not exist on jQuery.tooltip' );
        }
    };


})( jQuery );


