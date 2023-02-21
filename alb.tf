//todo add health checks and/or stickiness
resource "aws_lb_target_group" "web" {
  name        = "TargetGroup"
  port        = var.port
  target_type = "instance"
  protocol    = "HTTP"
  vpc_id      = "vpc-05171faed78691c10"
}

resource "aws_lb_target_group_attachment" "web" {
  target_group_arn = aws_lb_target_group.web.arn
  target_id        = aws_instance.web.id
  port             = var.port
}

resource "aws_lb" "lb" {
  name               = "helloworld"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.helloworld.id, ]
  subnets            = ["subnet-0038c568fd40b5ae7", "subnet-0fbe5e2b0bed61f46", "subnet-0087bfd615ddbaee4"]
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = aws_acm_certificate.self.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web.arn
  }
}

resource "aws_lb_listener_certificate" "self-signed" {
  listener_arn    = aws_lb_listener.https.arn
  certificate_arn = aws_acm_certificate.self.arn
}

resource "tls_self_signed_cert" "william" {
  private_key_pem = file("private.pem")

  subject {
    common_name  = "williammorrissey.com"
    organization = "William Morrissey, Inc"
  }

  validity_period_hours = 240

  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}

resource "aws_acm_certificate" "self" {
  private_key      = file("privateKey.key")
  certificate_body = tls_self_signed_cert.william.cert_pem
}

//todo add iam policy to service user to restrict access to acm for import only