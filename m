Return-Path: <linux-samsung-soc+bounces-692-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D0F813462
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Dec 2023 16:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 276CDB218B6
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Dec 2023 15:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16935C8F5;
	Thu, 14 Dec 2023 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ltvDi11o"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB8B1731
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 07:14:37 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-28ae5fbde22so919194a91.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 07:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702566876; x=1703171676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWqMHpUSkAPDn3wm2z4jDOhMdXvzCuosczZCAgcr4kM=;
        b=ltvDi11omEnn5qaqbSVvMf92ELR8bE6qNn/++dxsVNOur3z8xo7SAIKQJ/fL+IrpqW
         +X7iCi5e3BoyXyokbX4BkYjJz8zPO3FPtbEyQGgS/DGcCbUw7bW4e1w4kdwTQutKWiCC
         dmHh/sfjBe52v+3QEvGNV7jqM0OBjYaskaThRqMLsArR3TW5DDjHXazJfYkvhli7OgPk
         3b+dcl/04RMP670Ur/uBVW5FlQXFwO5pzfIPifD8iLQMGBe03KWGhTDYrzzy3ATvOJje
         IuixlPuB8/xBPIVcvKuMpLKxwruxCmshCgKVOt3Zl2r9ZcuGIkp+xPgYiD0BXUTF7k4h
         lQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702566876; x=1703171676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWqMHpUSkAPDn3wm2z4jDOhMdXvzCuosczZCAgcr4kM=;
        b=tdPiaFXDDlPXc9kH6CjPmrqu0kUxXstW7meUrRbBxHMwfec7CB8vuGozlWUuhUzPIw
         Mmh+KUsDwN5frABG77WawEQP1rpT3cg/3/OdioQi7TulBogNBYkE+fDJOQSLyXmpZRzV
         uyqubzbPHmvShKTLicLN7wwdUD4tOTHTSfAU7VXf6ILvyVf7nKClr5jO8OqXB+ZF6dnf
         yb6xG4ca3T6wpoa+GTjgc9rZxggVQnKNillN2ff8vsJXEl8QT+JPXaWvBIGLYB8G3X5b
         IGhXSLO2S7PtwZwNC+zeqCPicSXubYYuEesCaPohuByONCJwWAIpj8OKpS4Hbu8VCpmW
         E1Zg==
X-Gm-Message-State: AOJu0YxjTWfUWaecV+BezKzHtz1fxGGdUbU57Fzf3oCVw67uBHogsg0V
	1xaTbFmJ7mjw2P+L4SobjsSB+Tsov8AmJrbXj0jI+A==
X-Google-Smtp-Source: AGHT+IEM9NOntXhLmCrjcoIuQ47Pfui0YztUJd6OSshayTkyxMrEa+wi5LDmzXV8P+FrMsH0LnE9quA35R9O9TaR7Z4=
X-Received: by 2002:a17:90b:3697:b0:28b:d51:e7fe with SMTP id
 mj23-20020a17090b369700b0028b0d51e7femr354699pjb.64.1702566876603; Thu, 14
 Dec 2023 07:14:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org> <20231214105243.3707730-5-tudor.ambarus@linaro.org>
In-Reply-To: <20231214105243.3707730-5-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 14 Dec 2023 09:14:25 -0600
Message-ID: <CAPLW+4kBPj+f+aedr3yq_KTg7V7NFjK3RzFMypeYdQ-eos-NAA@mail.gmail.com>
Subject: Re: [PATCH 04/13] dt-bindings: serial: samsung: gs101: make
 reg-io-width required property
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	conor+dt@kernel.org, andi.shyti@kernel.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, arnd@arndb.de, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 4:52=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> GS101 only allows 32-bit register accesses. When using 8-bit reg
> accesses on gs101, a SError Interrupt is raised causing the system
> unusable.
>
> Make reg-io-width a required property and expect for it a value of 4.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b=
/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> index 133259ed3a34..cc896d7e2a3d 100644
> --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> @@ -143,6 +143,10 @@ allOf:
>      then:
>        required:
>          - samsung,uart-fifosize
> +        - reg-io-width
> +      properties:
> +        reg-io-width:
> +          const: 4
>
>  unevaluatedProperties: false
>
> --
> 2.43.0.472.g3155946c3a-goog
>

