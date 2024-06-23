import "./firstscript.js";

someGlobal.run = function () {
  return "hello from someGlobal.run in second script.";
};

// Handle create user submission
$("#createUserForm").on("submit", function (event) {
  event.preventDefault();

  const formData = new FormData(this);

  fetch("http://localhost:8080?action=createUser", {
    method: "POST",
    body: formData,
  })
    .then((response) => response.json())
    .then((data) => {
      if (data.success) {
        console.log("user created successfully", data);
        // TODO: use Handlebar templates and pass in results from request
        appManager.updateDisplay();
        // reload the page to get updated results shown in the list on successful create
        window.location.href = "http://localhost:8080";
      } else {
        console.error("create user had a problem: ", data);
        alert("Error: " + data.message || "No error message found.");
      }
    })
    .catch((error) => {
      alert("There was an error.", error);
      console.error("Error:", error);
    });
});