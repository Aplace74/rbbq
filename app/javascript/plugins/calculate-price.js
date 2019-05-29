console.log("hello")
const calculatePrice = () => {
    const form = document.querySelector("#new_booking");
    if (form) {
        form.addEventListener('change', event => {
            let startYear = document.querySelector("#booking_start_date_1i").value;
            let startMonth = parseInt(document.querySelector("#booking_start_date_2i").value, 10);
            let startDay = document.querySelector("#booking_start_date_3i").value;
            let startDate = new Date(startYear, (startMonth - 1), startDay);
            console.log(startDate)

            let endYear = document.querySelector("#booking_end_date_1i").value;
            let endMonth = parseInt(document.querySelector("#booking_end_date_2i").value, 10);
            let endDay = document.querySelector("#booking_end_date_3i").value;
            let endDate = new Date(endYear, (endMonth - 1), endDay);
            console.log(endDate);

            let oneDay = 24*60*60*1000; // hours*minutes*seconds*milliseconds

            let diffDays = Math.round(Math.abs((startDate.getTime() - endDate.getTime())/(oneDay)));
            console.log(diffDays);

            const rentalPrice = parseInt(document.getElementById("booking_rentalprice").value, 10);
            const totalPrice = `${(diffDays + 1) * rentalPrice}€ for ${diffDays + 1} day(s) rental`;
    
            console.log(endDate < startDate)

            if (endDate < startDate) {
                const errorMessage = `<span class="text-danger">End date can't be before Start date</span>`;
                document.getElementById("price").innerHTML = errorMessage;
            } else {
                console.log("je suis false");
                document.getElementById("price").innerHTML = totalPrice ;
            };                

        });
    };
};

export { calculatePrice };

// var oneDay = 24*60*60*1000; // hours*minutes*seconds*milliseconds
// var firstDate = new Date(2008,01,12);
// var secondDate = new Date(2008,01,22);

// var diffDays = Math.round(Math.abs((firstDate.getTime() - secondDate.getTime())/(oneDay)));