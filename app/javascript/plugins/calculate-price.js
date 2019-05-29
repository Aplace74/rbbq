const calculatePrice = () => {
    const form = document.querySelector("#new_booking");
    if (form) {
        form.addEventListener('change', event => {
            let startYear = document.querySelector("#booking_start_date_1i").value;
            let startMonth = parseInt(document.querySelector("#booking_start_date_2i").value, 10);
            let startDay = document.querySelector("#booking_start_date_3i").value;
            let startDate = new Date(startYear, (startMonth - 1), startDay);

            let endYear = document.querySelector("#booking_end_date_1i").value;
            let endMonth = parseInt(document.querySelector("#booking_end_date_2i").value, 10);
            let endDay = document.querySelector("#booking_end_date_3i").value;
            let endDate = new Date(endYear, (endMonth - 1), endDay);

            const oneDay = 24*60*60*1000; // hours*minutes*seconds*milliseconds
            let diffDays = Math.round(Math.abs((startDate.getTime() - endDate.getTime())/(oneDay)));
            console.log(diffDays);

            const rentalPrice = parseInt(document.getElementById("booking_rentalprice").value, 10);
            const totalPrice = `${(diffDays + 1) * rentalPrice}€ for ${diffDays + 1} day(s) rental`;
            const errorMessage1 = `<span class="text-danger">Start date can't be in the past</span>`;
            const errorMessage2 = `<span class="text-danger">End date can't be before Start date</span>`;
            const today = Date.now();

             if (startDate < today) {
                document.querySelector("input[type=submit]").disabled = true;
                document.getElementById("price").innerHTML = errorMessage1;            
             } else if (endDate < startDate) {
                document.querySelector("input[type=submit]").disabled = true;
                document.getElementById("price").innerHTML = errorMessage2;
            } else {
                document.querySelector("input[type=submit]").disabled = false;
                document.getElementById("price").innerHTML = totalPrice ;
            };
        });
    };
};

export { calculatePrice };
