Return-Path: <linux-samsung-soc+bounces-322-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CEA800F3B
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  1 Dec 2023 17:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A968FB20DB2
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  1 Dec 2023 16:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271BB4C60C;
	Fri,  1 Dec 2023 16:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RcBhOKLT"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 055F1173A
	for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Dec 2023 08:11:02 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-33318b866a0so2006400f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Dec 2023 08:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447060; x=1702051860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0h3wW3EqCfUl3aAlcYhLSxtfIdkOS0xIgf/1shl23vk=;
        b=RcBhOKLTHiVtHnUoHZOHk/Em4AqHpDW7lPQ2ZMiEOHgVNrgPOV8fQlaK/z5SAF4iWB
         mlMzEklVwjLhZGa22aHWdvrvnjMkEGFUQ5SIols2wsTSw1eqn9ozZpzFMmnuzJSguBOp
         BOPxnVo9xRIYzzmhZ0dcblPc3jfBHy13sA7DWkVjynuzyVu1aw0qf/j1Uny9p4FPFyNr
         wj1gKa/K3aUtHvxlFDmm0ZcRqiPXKbHJSfqCR+vL6TNdWxSwW7GO4ziBY9ldZCubSDqC
         TvyRbjxqTKfpm//nuaHLGlK6kF/o0YysW58/UiKF/ZmcZOEc/Avaxhii6sSS685QC3si
         vpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447060; x=1702051860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0h3wW3EqCfUl3aAlcYhLSxtfIdkOS0xIgf/1shl23vk=;
        b=tXSPJZwP1mI8/snlt+IuedQUF/Y13JmSxNOig/zrsunwaHfAVY712xnbHrLcsL13tB
         ouQRLQ1Hpv/RyltImPc5OdGg7e9uVf3axG8LDTnvcGSD3T/py1aRlX5W+ZJjGRjb1KfT
         9ygfYByM6CmqijTlWKcbl7b0J2Nr79lhnes8Zj1L1+JG6AWWWEGAPtIbCYMVCEmMADhQ
         4SivxwAm4TrCP41651f3f2Pq4WAsdp7eh5dkRA5ishnW2n7A9GIPN0jp8kmYlUvnnrff
         zPJFMIIyMR0ypIuhT9+4Q8nacukQnx5/zqF/3M0Rf3wrVnLGzx3j19gC+Jhr2BsU8d1B
         t4Wg==
X-Gm-Message-State: AOJu0YxQnK431qptef5AQA6QNRLxoFrkQdQaUMIEbRMiGM6sK5zBWlUR
	nb1Z4FW51j24jMtaxpyYRiGU8A==
X-Google-Smtp-Source: AGHT+IHXt7Ufyov+rsHLlszoNSf7f3sNJD+B0NBwhA3cKdYZFov1Hno0tqVBpT59cwEnzsqksoAleg==
X-Received: by 2002:a5d:58e1:0:b0:333:fd3:1a7f with SMTP id f1-20020a5d58e1000000b003330fd31a7fmr1221988wrd.52.1701447060579;
        Fri, 01 Dec 2023 08:11:00 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:10:59 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v5 08/20] dt-bindings: serial: samsung: Add google-gs101-uart compatible
Date: Fri,  1 Dec 2023 16:09:13 +0000
Message-ID: <20231201160925.3136868-9-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dedicated google-gs101-uart compatible to the dt-schema for
representing uart of the Google Tensor gs101 SoC.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index e32c1b462836..ccc3626779d9 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - apple,s5l-uart
           - axis,artpec8-uart
+          - google,gs101-uart
           - samsung,s3c6400-uart
           - samsung,s5pv210-uart
           - samsung,exynos4210-uart
-- 
2.43.0.rc2.451.g8631bc7472-goog


