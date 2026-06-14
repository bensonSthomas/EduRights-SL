/* ==========================================================
   EDURIGHTS SL - UPLOAD RESOURCE JAVASCRIPT
   Purpose:
   Handles file preview and submission readiness checks.
   ========================================================== */


// Wait until the page has fully loaded.
document.addEventListener("DOMContentLoaded", function () {

    // Get the file input field.
    const fileInput = document.getElementById("resourceFile");

    // Get preview text elements.
    const previewFileName = document.getElementById("previewFileName");
    const previewFileSize = document.getElementById("previewFileSize");

    // Get all fields used for readiness checking.
    const readinessFields = document.querySelectorAll(".readiness-field");


    // ======================================================
    // FORMAT FILE SIZE
    // Converts bytes into KB or MB for display.
    // ======================================================

    function formatFileSize(bytes) {

        if (bytes < 1024 * 1024) {

            return (bytes / 1024).toFixed(1) + " KB";

        }

        return (bytes / (1024 * 1024)).toFixed(2) + " MB";

    }


    // ======================================================
    // UPDATE FILE PREVIEW
    // Shows selected file name and file size.
    // ======================================================

    function updateFilePreview() {

        if (!fileInput || !fileInput.files.length) {

            previewFileName.textContent = "No file selected";
            previewFileSize.textContent = "Select a file to preview details.";

            return;

        }

        const file = fileInput.files[0];

        previewFileName.textContent = file.name;
        previewFileSize.textContent = "File size: " + formatFileSize(file.size);

    }


    // ======================================================
    // UPDATE CHECKLIST ITEM
    // Marks checklist item as complete or incomplete.
    // ======================================================

    function updateChecklistItem(id, isReady) {

        const item = document.getElementById(id + "-check");

        if (!item) {

            return;

        }

        const icon = item.querySelector("span");

        if (isReady) {

            item.classList.add("ready");
            icon.textContent = "✓";

        } else {

            item.classList.remove("ready");
            icon.textContent = "○";

        }

    }


    // ======================================================
    // UPDATE SUBMISSION READINESS
    // Checks form fields and updates the readiness panel.
    // ======================================================

    function updateReadiness() {

        const resourceInfoFields = document.querySelectorAll(
            '[data-readiness="resource-info"]'
        );

        const ownershipFields = document.querySelectorAll(
            '[data-readiness="ownership-info"]'
        );

        const licenseField = document.querySelector(
            '[data-readiness="license-selected"]'
        );

        const sdgField = document.querySelector(
            '[data-readiness="sdg-selected"]'
        );


        const resourceInfoReady = Array.from(resourceInfoFields).every(function (field) {

            return field.value.trim() !== "";

        });


        const ownershipReady = Array.from(ownershipFields).every(function (field) {

            return field.value.trim() !== "";

        });


        const licenseReady = licenseField && licenseField.value.trim() !== "";

        const sdgReady = sdgField && sdgField.value.trim() !== "";

        const fileReady = fileInput && fileInput.files.length > 0;


        updateChecklistItem("resource-info", resourceInfoReady);

        updateChecklistItem("ownership-info", ownershipReady);

        updateChecklistItem("license-selected", licenseReady);

        updateChecklistItem("sdg-selected", sdgReady);

        updateChecklistItem("file-attached", fileReady);

    }


    // ======================================================
    // EVENT LISTENERS
    // Runs checks when users type, select, or upload files.
    // ======================================================

    readinessFields.forEach(function (field) {

        field.addEventListener("input", updateReadiness);

        field.addEventListener("change", updateReadiness);

    });


    if (fileInput) {

        fileInput.addEventListener("change", function () {

            updateFilePreview();

            updateReadiness();

        });

    }


    // Run once when page loads.
    updateReadiness();

});