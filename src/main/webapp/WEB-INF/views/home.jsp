<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jspf" %>
	<!-- 소개페이지 -->
	<section class="page-section" id="intro">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase"> HG 홈페이지 </h2>
				<h3 class="section-subheading text-muted"> 상세정보 </h3>
			</div>
			<div class="row text-center">
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fas fa-circle fa-stack-2x text-primary"></i> <i
						class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="my-3">E-Commerce</h4>
					<p class="text-muted"> </p>
				</div>
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fas fa-circle fa-stack-2x text-primary"></i> <i
						class="fas fa-laptop fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="my-3">Responsive Design</h4>
					<p class="text-muted">
					
					</p>
				</div>
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fas fa-circle fa-stack-2x text-primary"></i> <i
						class="fas fa-lock fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="my-3">Web Security</h4>
					<p class="text-muted">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Minima maxime quam architecto quo inventore
						harum ex magni, dicta impedit.</p>
				</div>
			</div>
		</div>
	</section>
	<!-- 상품 목록 페이지-->
	<section class="page-section bg-light" id="shop">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">상품 목록</h2>
				<h3 class="section-subheading text-muted">행복을 주는 (주)HG Happiness Guitar 상품 페이지에 오신 것을 환영합니다.</h3>
			</div>
			<div class="row">
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- 상품 목록 1-->					
					<div class="shop-item">
						<a class="shop-link" data-bs-toggle="modal" href="#shop1">
							<div class="shop-hover">
								<div class="shop-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid" src="${contextPath}/resources/assets/img/shop/1.jpg" />
						</a>
						<div class="shop-caption">
							<div class="shop-caption-heading">제목</div>
							<div class="shop-caption-subheading text-muted">상품설명</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- 상품 목록 2-->
					<div class="shop-item">
						<a class="shop-link" data-bs-toggle="modal"
							href="#shopModal2">
							<div class="shop-hover">
								<div class="shop-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid" src="assets/img/shop/2.jpg"
							alt="..." />
						</a>
						<div class="shop-caption">
							<div class="shop-caption-heading">Explore</div>
							<div class="shop-caption-subheading text-muted">Graphic
								Design</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- 상품 목록 3-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal3">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid" src="assets/img/portfolio/3.jpg"
							alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">Finish</div>
							<div class="portfolio-caption-subheading text-muted">Identity</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
					<!-- 상품 목록 4-->
					<div class="shop-item">
						<a class="shop-link" data-bs-toggle="modal"
							href="#shopModal4">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid" src="assets/img/portfolio/4.jpg"
							alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">Lines</div>
							<div class="portfolio-caption-subheading text-muted">Branding</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
					<!-- 상품 목록 5-->
					<div class="shop-item">
						<a class="shop-link" data-bs-toggle="modal"
							href="#shop5">
							<div class="shop-hover">
								<div class="shop-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid" src="assets/img/shop/5.jpg"
							alt="..." />
						</a>
						<div class="shop-caption">
							<div class="shop-caption-heading">Southwest</div>
							<div class="shop-caption-subheading text-muted">Website
								Design</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<!-- 상품 목록 6-->
					<div class="shop-item">
						<a class="shop-link" data-bs-toggle="modal"
							href="#shopModal6">
							<div class="shop-hover">
								<div class="shop-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> 
							<img class="img-fluid" src="${contextPath}/resources/assets/img/shop/6.jpg"/>
							
						</a>
						<div class="shop-caption">
							<div class="shop-caption-heading">Window</div>
							<div class="shop-caption-subheading text-muted">Photography</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Team-->
	<section class="page-section bg-light" id="team">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase"> 공연 일정 </h2>
				<h3 class="section-subheading text-muted"> 추후 공지 </h3>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle" src="${contextPath}/resources/assets/img/team/1.jpg"
							alt="..." />
						<h4>Sungha Jung</h4>
						<p class="text-muted">Special Guitarlist</p>
						<a class="btn btn-dark btn-social mx-2" href="#!"
							aria-label="Parveen Anand Twitter Profile"><i
							class="fab fa-twitter"></i></a> <a
							class="btn btn-dark btn-social mx-2" href="#!"
							aria-label="Parveen Anand Facebook Profile"><i
							class="fab fa-facebook-f"></i></a> <a
							class="btn btn-dark btn-social mx-2" href="#!"
							aria-label="Parveen Anand LinkedIn Profile"><i
							class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle" src="${contextPath}/resources/assets/img/team/2.jpg"
							alt="..." />
						<h4>John Clayton Mayer</h4>
						<p class="text-muted">Special Guitarlist</p>
						<a class="btn btn-dark btn-social mx-2" href="#!"
							aria-label="Diana Petersen Twitter Profile"><i
							class="fab fa-twitter"></i></a> <a
							class="btn btn-dark btn-social mx-2" href="#!"
							aria-label="Diana Petersen Facebook Profile"><i
							class="fab fa-facebook-f"></i></a> <a
							class="btn btn-dark btn-social mx-2" href="#!"
							aria-label="Diana Petersen LinkedIn Profile"><i
							class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle" src="${contextPath}/resources/assets/img/team/3.jpg"
							alt="..." />
						<h4>Kotaro Oshio</h4>
						<p class="text-muted">Special Guitarlist</p>
						<a class="btn btn-dark btn-social mx-2" href="#!"
							aria-label="Larry Parker Twitter Profile"><i
							class="fab fa-twitter"></i></a> <a
							class="btn btn-dark btn-social mx-2" href="#!"
							aria-label="Larry Parker Facebook Profile"><i
							class="fab fa-facebook-f"></i></a> <a
							class="btn btn-dark btn-social mx-2" href="#!"
							aria-label="Larry Parker LinkedIn Profile"><i
							class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 mx-auto text-center">
					<p class="large text-muted"> 유명 기타리스트 및 가수 공연 일정은 한 달 전에 발표되니 이 점 유의해주시기 바랍니다.
											<br> ☎ 문의 번호 : <strong> 0101-4404-3392 <strong></p>
				</div>
			</div>
		</div>
	</section>
	<!-- business partner-->
	<div class="py-5">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-3 col-sm-6 my-3">
					<a href="#!"><img class="img-fluid img-brand d-block mx-auto"
						src="${contextPath}/resources/assets/img/logos/microsoft.svg" 
						aria-label="Microsoft Logo" /></a>
				</div>
				<div class="col-md-3 col-sm-6 my-3">
					<a href="#!"><img class="img-fluid img-brand d-block mx-auto"
						src="${contextPath}/resources/assets/img/logos/google.svg" 
						aria-label="Google Logo" /></a>
				</div>
				<div class="col-md-3 col-sm-6 my-3">
					<a href="#!"><img class="img-fluid img-brand d-block mx-auto"
						src="${contextPath}/resources/assets/img/logos/facebook.svg" 
						aria-label="Facebook Logo" /></a>
				</div>
				<div class="col-md-3 col-sm-6 my-3">
					<a href="#!"><img class="img-fluid img-brand d-block mx-auto"
						src="${contextPath}/resources/assets/img/logos/ibm.svg" aria-label="IBM Logo" /></a>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact-->
	<section class="page-section" id="contact">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">Contact Us</h2>
				<h3 class="section-subheading text-muted">Lorem ipsum dolor sit
					amet consectetur.</h3>
			</div>
			<!-- * * * * * * * * * * * * * * *-->
			<!-- * * SB Forms Contact Form * *-->
			<!-- * * * * * * * * * * * * * * *-->
			<!-- This form is pre-integrated with SB Forms.-->
			<!-- To make this form functional, sign up at-->
			<!-- https://startbootstrap.com/solution/contact-forms-->
			<!-- to get an API token!-->
			<form id="contactForm" data-sb-form-api-token="API_TOKEN">
				<div class="row align-items-stretch mb-5">
					<div class="col-md-6">
						<div class="form-group">
							<!-- Name input-->
							<input class="form-control" id="name" type="text"
								placeholder="Your Name *" data-sb-validations="required" />
							<div class="invalid-feedback" data-sb-feedback="name:required">A
								name is required.</div>
						</div>
						<div class="form-group">
							<!-- Email address input-->
							<input class="form-control" id="email" type="email"
								placeholder="Your Email *" data-sb-validations="required,email" />
							<div class="invalid-feedback" data-sb-feedback="email:required">An
								email is required.</div>
							<div class="invalid-feedback" data-sb-feedback="email:email">Email
								is not valid.</div>
						</div>
						<div class="form-group mb-md-0">
							<!-- Phone number input-->
							<input class="form-control" id="phone" type="tel"
								placeholder="Your Phone *" data-sb-validations="required" />
							<div class="invalid-feedback" data-sb-feedback="phone:required">A
								phone number is required.</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group form-group-textarea mb-md-0">
							<!-- Message input-->
							<textarea class="form-control" id="message"
								placeholder="Your Message *" data-sb-validations="required"></textarea>
							<div class="invalid-feedback" data-sb-feedback="message:required">A
								message is required.</div>
						</div>
					</div>
				</div>
				<!-- Submit success message-->
				<!---->
				<!-- This is what your users will see when the form-->
				<!-- has successfully submitted-->
				<div class="d-none" id="submitSuccessMessage">
					<div class="text-center text-white mb-3">
						<div class="fw-bolder">Form submission successful!</div>
						To activate this form, sign up at <br /> <a
							href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
					</div>
				</div>
				<!-- Submit error message-->
				<!---->
				<!-- This is what your users will see when there is-->
				<!-- an error submitting the form-->
				<div class="d-none" id="submitErrorMessage">
					<div class="text-center text-danger mb-3">Error sending
						message!</div>
				</div>
				<!-- Submit Button-->
				<div class="text-center">
					<button class="btn btn-primary btn-xl text-uppercase disabled"
						id="submitButton" type="submit">Send Message</button>
				</div>
			</form>
		</div>
	</section>
	