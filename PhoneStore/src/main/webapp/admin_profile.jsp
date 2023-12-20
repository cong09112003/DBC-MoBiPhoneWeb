<%-- 
    Document   : admin_profile
    Created on : Dec 2, 2023, 9:52:21 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shop profile</title>
        <link rel="stylesheet" href="styles/admin_profile.css"/>
    </head>
    <body>
        <%
            session.setAttribute("wn_Home", false);
            session.setAttribute("wn_Cart", false);
            session.setAttribute("wn_User", false);
            session.setAttribute("wn_InfShop", true);
            session.setAttribute("wn_Comment", false);
        %>
        <%@include file="customer_header.jsp" %>
        <main class="l-main">
            <!--===== HOME =====-->
            <section class="home bd-grid" id="home">
                <div class="home__data">
                    <h1 class="home__title">Hi,<br>we are <br> <span class="home__title-color">Mobile Store</span></h1>
                </div>

                <div class="home__social">
                    <a href="" class="home__social-icon"><i class='bx bxl-github'></i></a>
                    <a href="" class="home__social-icon"><i class='bx bxl-linkedin'></i></a>
                    <a href="" class="home__social-icon"><i class='bx bxl-behance'></i></a>

                </div>

                <div class="home__img">
                    <img src="img/logo_store.png" alt="">
                </div>
            </section>

            <!--===== ABOUT =====-->
            <section class="about section " id="about">
                <h2 class="section-title">About</h2>

                <div class="about__container bd-grid">
                    <div class="about__img">
                        <img src="img/anhdiachi.png" alt="">
                    </div>

                    <div>
                        <h2 class="about__subtitle">We are Mobile Store</h2>
                        <p class="about__text">Welcome to our Mobile Store, where cutting-edge technology meets seamless
                            design to provide you with the latest and most innovative mobile devices.
                            Whether you're looking for high-performance flagship models, budget-friendly options, or
                            something in between, our mobile shop offers a range of choices to suit every lifestyle.</p>
                    </div>
                </div>
            </section>

            <section class="skills section" id="skills">
                <h2 class="section-title">Hotline</h2>

                <div class="skills__container bd-grid">
                    <div>
                        <h2 class="skills__subtitle">Information</h2>

                        <div class="skills__data">
                            <div class="skills__names">
                                <i class='bx bxl-html5 skills__icon'></i>
                                <span class="skills__name">Email: nguyenthanhloi260303@gmail.com</span>
                            </div>


                        </div>
                        <div class="skills__data">
                            <div class="skills__names">
                                <i class='bx bxl-css3 skills__icon'></i>
                                <span class="skills__name">Shop Address: Ho Chi Minh City University of Technology and Education.</span>
                            </div>

                        </div>
                        <div class="skills__data">
                            <div class="skills__names">
                                <i class='bx bxl-javascript skills__icon'></i>
                                <span class="skills__name">Phone number: 08559102334</span>
                            </div>

                        </div>
                    </div>

                    <div>
                        <img src="assets/img/work3.jpg" alt="" class="skills__img">
                    </div>
                </div>
            </section>
        </main>


        <!--===== FOOTER =====-->
        <footer class="footer">
            <p class="footer__title">Mobile Store</p>
            <div class="footer__social">
                <a href="#" class="footer__icon"><i class='bx bxl-facebook'></i></a>
                <a href="#" class="footer__icon"><i class='bx bxl-instagram'></i></a>
                <a href="#" class="footer__icon"><i class='bx bxl-twitter'></i></a>
            </div>

        </footer>


        <!--===== SCROLL REVEAL =====-->
        <script src="https://unpkg.com/scrollreveal"></script>

        <!--===== MAIN JS =====-->
        <script src="js/admin_profile.js"></script>
    </body>
</html>
