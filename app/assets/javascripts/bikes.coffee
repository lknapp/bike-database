seatTubeIn = $(".seat-tube-in")
seatTubeCm = $(".seat-tube-cm")

seatTubeIn.on("change", () ->
  seatTubeCm.val(parseFloat(seatTubeIn.val())*2.54)
)
