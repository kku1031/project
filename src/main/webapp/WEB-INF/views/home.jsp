<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/header.jspf" %>
	<!-- 소개페이지 -->
	<section class="page-section" id="intro">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase"> 홈페이지 정보 </h2>
				<h3 class="section-subheading text-muted"> 상세정보 </h3>
			</div>
			<div class="row text-center">
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fas fa-circle fa-stack-2x text-primary"></i> <i
						class="fas fa-shopping-cart fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="my-3">E-커머스</h4>
					<p class="text-muted"> e커머스(전자상거래)는 인터넷 웹사이트상에 구축된 가상의 상점을 통해 제품과 서비스를 사고 파는 모든 행위를 말한다. 이보다 넓은 개념으로 개인 기업 정부등 경제활동 주체들이 전화 팩스 컴퓨터 등 전자매체를 통신망과 결합해 제품이나 서비스를 사고 파는 행위를 말하기도 한다.
					</p>
				</div>
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fas fa-circle fa-stack-2x text-primary"></i> <i
						class="fas fa-laptop fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="my-3">Responsive Design</h4>
					<p class="text-muted">
					반응형 웹 디자인(responsive web design, RWD)이란 하나의 웹사이트에서 PC, 스마트폰, 태블릿 PC 등 접속하는 디스플레이의 종류에 따라 화면의 크기가 자동으로 변하도록 만든 웹페이지 접근 기법을 말합니다. 웹사이트를 PC용과 모바일용으로 각각 별개로 제작하지 않고, 하나의 공용 웹사이트를 만들어 다양한 디바이스에 대응할 수 있습니다. 
					</p>
				</div>
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <i
						class="fas fa-circle fa-stack-2x text-primary"></i> <i
						class="fas fa-lock fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="my-3">웹 보안 모듈</h4>
					<p class="text-muted">웹 서비스가 증가하면서 이와 함께 응용 프로그램의 알려진 취약점을 악용하여 정상적인 서버 운영을 방해하거나 개인정보 유출 시도 등 웹 사이트 공격이 지속해서 증가하면서 공격의 종류도 다양해지고 있습니다. 이러한 공격으로부터 안전하게 보호할 수 있는 것이 웹 보안 모듈입니다.</p>
				</div>
			</div>
		</div>
	</section>
	<!-- 상품 목록 페이지-->
	<section class="page-section bg-light" id="portfolio">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">상품 목록</h2>
                    <h3 class="section-subheading text-muted">행복을 주는 (주)HG Happiness Guitar 상품 페이지에 오신 것을 환영합니다.</h3>
                </div>
              <div class="row">
                <c:forEach var="b" items="${list}">
                <c:if test="${not empty b.attachList[0].imageName}">
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <div class="portfolio-item">
                            <a class="portfolio-link" data-bs-toggle="modal" href="#portfolioModal1">
                            	<div class="d-flex justify-content-center">
                            		<img class="img-fluid" src="${contextPath}/display?fileName=${b.attachList[0].imageName}"/>
                            	</div>                       
                            </a>                           
                        </div>
                    </div>
                </c:if>
               	</c:forEach>
             </div>
            </div> 
    </section>        	
	<!-- 공연일정 -->
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
						<a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Parveen Anand Twitter Profile"><i class="fab fa-twitter"></i></a>
						<a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Parveen Anand Facebook Profile"><i class="fab fa-facebook-f"></i></a>
						<a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Parveen Anand LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle" src="${contextPath}/resources/assets/img/team/2.jpg"
							alt="..." />
						<h4>John Clayton Mayer</h4>
						<p class="text-muted">Special Guitarlist</p>
						<a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Parveen Anand Twitter Profile"><i class="fab fa-twitter"></i></a>
						<a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Parveen Anand Facebook Profile"><i class="fab fa-facebook-f"></i></a>
						<a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Parveen Anand LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle" src="${contextPath}/resources/assets/img/team/3.jpg"
							alt="..." />
						<h4>Kotaro Oshio</h4>
						<p class="text-muted">Special Guitarlist</p>
						<a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Parveen Anand Twitter Profile"><i class="fab fa-twitter"></i></a>
						<a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Parveen Anand Facebook Profile"><i class="fab fa-facebook-f"></i></a>
						<a class="btn btn-dark btn-social mx-2" href="#!" aria-label="Parveen Anand LinkedIn Profile"><i class="fab fa-linkedin-in"></i></a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8 mx-auto text-center">
					<p class="large text-muted"> 유명 기타리스트 및 가수 공연 일정은 한 달 전에 발표되니 이 점 유의해주시기 바랍니다. <br> ☎ 문의 번호 : <strong> 0101-4404-3392 <strong></p>
				</div>
			</div>
		</div>
	</section>
	<!-- 협력사 -->
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
<%@ include file="layout/header.jspf" %>
 -- 코드 생략 --	
<%@ include file="layout/footer.jspf" %>	