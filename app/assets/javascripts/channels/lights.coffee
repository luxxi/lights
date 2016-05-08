App.lights = App.cable.subscriptions.create "LightsChannel",
  connected: ->
    $('.switch').bootstrapSwitch onSwitchChange: (event, state) =>
      @switch(state, $(event.target).data('type'))

  received: (data) ->
    $(".switch[data-type=#{data.type}]").bootstrapSwitch('state', data.state, true)

  switch: (state, type) ->
    @perform 'switch', state: state, type: type
