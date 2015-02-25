class StatusCodeView extends Backbone.View
  initialize: ->

  render: ->
    template = @template()
    $(@el).html(template(@model))
    swaggerContext = @options.swaggerContext

    if swaggerContext.api.models.hasOwnProperty @model.responseModel
      responseModel =
        sampleJSON: JSON.stringify(swaggerContext.api.models[@model.responseModel].createJSONSample(), null, 2)
        isParam: false
        signature: swaggerContext.api.models[@model.responseModel].getMockSignature()

      responseModelView = new SignatureView({model: responseModel, tagName: 'div'})
      $('.model-signature', @$el).append responseModelView.render().el
    else
      $('.model-signature', @$el).html ''
    @

  template: ->
    Handlebars.templates.status_code

