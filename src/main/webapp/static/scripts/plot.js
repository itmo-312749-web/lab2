const plot = document.querySelector("#plot")
const plotWidth = plot.width.baseVal.value
const plotHeight = plot.height.baseVal.value

const drawCurrentDot = (x, y) => {
    const removableDot = plot.querySelector(":scope > #current-dot")
    if (removableDot)
        plot.removeChild(removableDot)

    const ns = "http://www.w3.org/2000/svg"
    const dot = document.createElementNS(ns, "circle")

    dot.id = "current-dot"
    dot.setAttribute("cx", x)
    dot.setAttribute("cy", y)
    dot.setAttribute("r", 3)
    dot.setAttribute("fill", "black")

    plot.appendChild(dot)
}

plot.addEventListener("click", (e) => {
    if (!userData.isRValid()) {
        alert("Set valid radius!")
        return
    }

    const rawX = e.offsetX - plotWidth / 2
    const rawY = -(e.offsetY - plotHeight / 2)

    const normalizedX = Number(rawX / 150 * userData.r).toFixed(5)
    userData.setX(normalizedX)
    const normalizedY = Number(rawY / 150 * userData.r).toFixed(5)
    userData.setY(normalizedY)

    drawCurrentDot(e.offsetX, e.offsetY)

    userData.isSetWithForm = false
    console.log(userData)
})