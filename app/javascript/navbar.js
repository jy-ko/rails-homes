// Profile menu dropdown
document.getElementById("user-menu-button").addEventListener("click", function() {
    document.getElementById("dropdownMenu").classList.toggle("hidden")
    document.getElementById("dropdownMenu").classList.toggle("block")
})


// Mobile menu dropdown
document.getElementById("hamburger-menu").addEventListener("click", function() {
    console.log("Hi");
    document.getElementById("mobile-menu").classList.toggle("hidden")
    document.getElementById("mobile-menu").classList.toggle("block")
})

