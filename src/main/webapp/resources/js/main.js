const target = document.querySelector('.target');
const links = document.querySelectorAll('.mynav a');
const colors = ['deepskyblue', 'oragne', 'black', 'green', 'gold', 'magenta', 'darkblue', 'red'];

//링크
for(let i= 0; i<links.length; i++){
//	links[i].addEventListener('click', (e) => e.preventDefault());
	links[i].addEventListener('mouseenter', mouseenterFunc);
//	links[i].addEventListener("click", () => {
//		      let targetLink = this.getAttribute('href');
//		      location.href = targetLink;
//		   
//		    });     
}

function mouseenterFunc(){
	if(!this.parentNode.classList.contains('active')){
		for(let i = 0; i<links.length; i++){
			if(links[i].parentNode.classList.contains('active')){
				links[i].parentNode.classList.remove('active');
			}
			links[i].style.opacity = '0.5';
		}
		
		this.parentNode.classList.add('active');
		this.style.opacity = '1';
		
		const width = this.getBoundingClientRect().width;
		const height = this.getBoundingClientRect().height;
		const left = this.getBoundingClientRect().left + window.pageXOffset;
		const top = this.getBoundingClientRect().top + window.pageYOffset;
		const color = colors[Math.floor(Math.random() * links.length)];

		target.style.width = width + 'px';
		target.style.height = height + 'px';
		target.style.left = left + 'px';
		target.style.top = top + 'px';
		target.style.borderColor = color;
	}
} //mouseenterFunc

function resizeFunc(){
	const active = document.querySelector('.mynav li.active');
	
	if(active){
		const left = active.getBoundingClientRect().left + window.pageXOffset;
		const top = active.getBoundingClientRect().top + window.pageYOffset;
		
		target.style.left = left + 'px';
		target.style.top = top + 'px';
	}
}
window.addEventListener('resize', resizeFunc);
