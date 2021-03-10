const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-ajax');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight - 200) {
        navbar.classList.add('navbar-ajax-white');
      } else {
        navbar.classList.remove('navbar-ajax-white');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
