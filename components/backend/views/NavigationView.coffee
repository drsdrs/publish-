define [
  'jquery'
  'lodash'
  'backbone'
  'marionette'
  'cs!../Command'
  'tpl!../templates/navItem.html'
],
($, _, Backbone, Marionette, Command, Template) ->
  
  class NavigationItemView extends Backbone.Marionette.ItemView
    template: Template
    tagName: 'li'

  class NavigationView extends Backbone.Marionette.CollectionView
    el: "#navigation"
    itemView: NavigationItemView
    
    events:
      "click li": "clicked"
      
    clicked: (e)->
      @children.each (view)->
        view.$el.removeClass "active"
      $(e.target).parent().addClass "active"
