const xActualValue = document.querySelector("#x-actual-value")
const yActualValue = document.querySelector("#y-actual-value")
const rActualValue = document.querySelector("#r-actual-value")


const userData = {
    isSetWithForm: true,

    x: null,
    getX() {
        return this.x
    },
    setX(val) {
        xActualValue.value = val
        this.x = val
    },
    isXSet() {
        return this.x !== null && this.x !== undefined
    },
    isXValid() {
        let validXValues = [-2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2]
        return this.x !== null && validXValues.includes(parseFloat(this.x))
    },

    y: null,
    getY() {
        return this.y
    },
    setY(val) {
        yActualValue.value = val
        this.y = val
    },
    isYSet() {
        return this.y !== null && this.y !== undefined
    },
    isYValid() {
        let parsedY = parseFloat(this.y)
        console.log(-3 <= parsedY && parsedY <= 3)
        return -3 <= parsedY && parsedY <= 3
    },

    r: null,
    getR() {
        return this.r
    },
    setR(val) {
        rActualValue.value = val
        this.r = val
    },
    isRSet() {
        return this.r !== null && this.r !== undefined
    },
    isRValid() {
        let validRValues = [1, 2, 3, 4, 5]
        return validRValues.includes(parseFloat(this.r))
    },

    isValid() {
        if (this.isSetWithForm)
            return this.isXValid() &&
                this.isYValid() &&
                this.isRValid()
        else
            return this.isXSet() &&
                this.isYSet() &&
                this.isRValid()
    }
}


const xRadioList = document.querySelectorAll("input.x-radio-input[type=radio]")
xRadioList.forEach((radio) => {
    radio.addEventListener("click", (e) => {
        userData.setX(e.target.value)
        console.log(userData)
    })
})

const yInput = document.querySelector("#y-input")
yInput.addEventListener("change", (e) => {
    userData.setY(e.target.value)
    if (!userData.isYValid()) {
        yInput.classList.add("is-invalid")
    } else {
        yInput.classList.remove("is-invalid")
    }
    console.log(userData)
})

const rCheckboxList = document.querySelectorAll("input.r-checkbox-input[type=checkbox]")
rCheckboxList.forEach((checkbox) => {
    checkbox.addEventListener("click", (e) => {
        rCheckboxList.forEach((__radius) => {
            __radius.checked = false
        })
        checkbox.checked = true
        userData.setR(e.target.value)
        console.log(userData)
    })
})


const clearBtn = document.querySelector("#clear-btn")
clearBtn.addEventListener("click", (e) => {
    xRadioList.forEach((radio) => {
        radio.checked = false
    })
    userData.setY(null)

    yInput.value = ""
    yInput.classList.remove("is-invalid")
    userData.setY(null)

    rCheckboxList.forEach((checkbox) => {
        checkbox.checked = false
    })
    userData.setR(null)

    const removableDot = document.querySelector("#plot")
        .querySelector(":scope > #current-dot")
    if (removableDot)
        document.querySelector("#plot")
            .removeChild(removableDot)
})

const submitBtn = document.querySelector("#submit-btn")
submitBtn.addEventListener("click", (e) => {
    e.preventDefault()
    e.stopPropagation()
    if (!userData.isValid()) {
        alert("Invalid form data")
        clearBtn.click()
        return
    }

    const form = document.querySelector("#user-data-form")
    // const formData = new FormData(form)
    // form.

    form.submit()
})
