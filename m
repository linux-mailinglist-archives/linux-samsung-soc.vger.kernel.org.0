Return-Path: <linux-samsung-soc+bounces-580-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C136280D148
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 11 Dec 2023 17:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2C2F1C210A6
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 11 Dec 2023 16:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E21F4CDE1;
	Mon, 11 Dec 2023 16:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cQuW+4Sz"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C874D107
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Dec 2023 08:24:20 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40c2c65e6aaso46986195e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Dec 2023 08:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311859; x=1702916659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHn6La4SxICedZgCH1SVIME+UAZa7Q6nySeOkcn6arQ=;
        b=cQuW+4SzKo0rtB4RlQkun513oPbkZtjExhLs6ydAupEVQGbfKjxhk2w5uG5LfNvwMm
         TPNKqyzMpsi4FgUE2FY4kJHi/dIhVdGF3TE35qlOp5izpPa4QVXNp18VWm5EHEdujdrD
         m2oP0dNbgWBJjJW42j/LD+5dFhbclCjG8MyFCa1MDFghVGBp9Da3uOt58lVnNB6yHCPv
         x5I0dgaOV52AT7S8Vo4sHVh2IRwriTHOYBDcu2c1UNz2ZheZmUAr1bGyvhHPym3h1WJD
         eFeVwUF2TfpLD/5/bovDNGcsuRhKK1A/7wECmOb+xdJrL1N2m2Xw476Z2uutbag1JC1p
         sqqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311859; x=1702916659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uHn6La4SxICedZgCH1SVIME+UAZa7Q6nySeOkcn6arQ=;
        b=Z/kUeU+WUco5mDLdiak863GpDsGUxvlGKi2p3U8eXxfKfTwdvHg4K6Au97mRV1MIeB
         jlbLD3SIndafSbcjp9g+h3MIlSCUQA2kKVQnPaNopueL+NFqoF9T230lXyQtUX6imC8B
         PL5q5EZPhiJKOzDxpT7LpNPtzyiKn87KKX3I2Njqc0J+6Gjip/WsiXRwdq5sxnmvanWE
         GQWKuhe0wAXiJSHXLji76bZW2MZv2+b6V77dQkMwBhjMjy1eqtQz/l9fgl/7Um8NTH93
         o+BZa4r5X9OERxCiDd3mX7LW0NrIacouzpzgiupUyCTGpcer4vLWDGnan+AvZ6VZ911O
         XnMg==
X-Gm-Message-State: AOJu0YytDpW/Xc+pz9rODiCwRpmUgcsQKz1G43+kAvf9UyXaDDc1DGkm
	13lNld4VdSM7RPwGWCXt/AaMdA==
X-Google-Smtp-Source: AGHT+IEmf6M1kKz97d9swAyZHxrDmo9Qm70c5j0hECQTw3R9XBH94lhiP5Z8mVJVo/XZZ6lHXKjMTw==
X-Received: by 2002:a05:600c:1715:b0:40c:267e:314c with SMTP id c21-20020a05600c171500b0040c267e314cmr2222341wmn.103.1702311859112;
        Mon, 11 Dec 2023 08:24:19 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:18 -0800 (PST)
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
Subject: [PATCH v7 04/16] dt-bindings: serial: samsung: Make samsung,uart-fifosize a required property
Date: Mon, 11 Dec 2023 16:23:19 +0000
Message-ID: <20231211162331.435900-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Specifying samsung,uart-fifosize in both DT and driver static data is error
prone and relies on driver probe order and dt aliases to be correct.

Additionally on many Exynos platforms these are (USI) universal serial
interfaces which can be uart, spi or i2c, so it can change per board.

For google,gs101-uart make samsung,uart-fifosize a required property.
For this platform fifosize now *only* comes from DT.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/serial/samsung_uart.yaml       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 6af274d2f185..133259ed3a34 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -134,6 +134,16 @@ allOf:
             - const: uart
             - const: clk_uart_baud0
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-uart
+    then:
+      required:
+        - samsung,uart-fifosize
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0.472.g3155946c3a-goog


