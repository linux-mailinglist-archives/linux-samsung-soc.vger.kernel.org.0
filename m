Return-Path: <linux-samsung-soc+bounces-675-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89733812DBA
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Dec 2023 11:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13204B21484
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Dec 2023 10:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989083FE53;
	Thu, 14 Dec 2023 10:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FV+DjVE8"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01785D4D
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 02:53:04 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40c2308faedso81896835e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 02:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702551183; x=1703155983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4iA5vpao/nlkM+BgS1JES9JQXKEWnmeNI0auTBLc7cY=;
        b=FV+DjVE8H70sTQH6kRDVqJ3wExPAVdqrMa24gJvMtraeUJisUsqEL1EDAs6Mp2JBDH
         wokxdMyYpkFz5aI0NdfEdywYYHonlNu5elwoHncMnf7w6VxUXoVfSYUji70EyjLIIC9X
         5s4ejiA4GXYwzSIlaoNWQxqldQdyL3gZMvq3J/2G9V1BVl0nupXxbO5O6We3VB8zVuTM
         mp436UXfkCZYP3ZzoHkwwtju0tPsM615UA2EJQLiTWgxvfBbxPjhXVg//UIu49VIdCi0
         EHNTL2oqGrGKHILl5FrCUHRbHP3NyyGck1KdsJrQ5EAPdv4Suxy+8cvISAKrzyu5Z0H9
         8wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702551183; x=1703155983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iA5vpao/nlkM+BgS1JES9JQXKEWnmeNI0auTBLc7cY=;
        b=T2BN1Ld/3Irz89VUHmCi5Bmrq3/gQhzP7KMhCBxh81ikRtqah+LUnG0ZjCxTIhNCxr
         Teofk1t9RiTegebVQSbezK7ptT/W9Qx7m2uT5A109498rRAOi+21spCVuxsctJMd3FG1
         xvq/KjKvSoHWofYyxoVi5kY3WPpGyOjJ/WJntPgyIemu9UqZbk/UtQZDswoeuoUeAmKX
         HRRv5I/I/cr0eJW08oq1iwh6z13EqHWZyn7VEVWHuHoXAW/r1UVTq6o5mQZEZPzJciWz
         4uSTboiPrLlLbXWfOnZTDfaOZmdX/3YMyarEHNW9GaRT8YYClEe5QQQd7tJp/iDJbukF
         oqbw==
X-Gm-Message-State: AOJu0YzjtYXAEQg9RYYVUcBrlFsvODR4yfAEA6GE3+jcV2EoYSivo1Zx
	ZrOON4drxU2unPUg6Hfv1zrE0Q==
X-Google-Smtp-Source: AGHT+IFhXWtaTCFsSRB/rCN50lEOB2f4DScvINgysd4f+wNUqjxRfR1ruqRktKeZe3CB7TSMb14q8Q==
X-Received: by 2002:a05:600c:4d0e:b0:40b:5e1e:cf1 with SMTP id u14-20020a05600c4d0e00b0040b5e1e0cf1mr4741397wmp.44.1702551183507;
        Thu, 14 Dec 2023 02:53:03 -0800 (PST)
Received: from ta2.c.googlers.com.com (216.131.76.34.bc.googleusercontent.com. [34.76.131.216])
        by smtp.gmail.com with ESMTPSA id p7-20020a05600c468700b0040c420eda48sm17614854wmo.22.2023.12.14.02.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:53:02 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	arnd@arndb.de,
	semen.protsenko@linaro.org
Cc: andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 13/13] arm64: defconfig: make at24 eeprom builtin
Date: Thu, 14 Dec 2023 10:52:43 +0000
Message-ID: <20231214105243.3707730-14-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gs101-oriole populates an at24 eeprom on the battery connector.
Make EEPROM_AT24 builtin.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 09fb467303ba..19c1d61382f6 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -276,7 +276,7 @@ CONFIG_QCOM_COINCELL=m
 CONFIG_QCOM_FASTRPC=m
 CONFIG_SRAM=y
 CONFIG_PCI_ENDPOINT_TEST=m
-CONFIG_EEPROM_AT24=m
+CONFIG_EEPROM_AT24=y
 CONFIG_EEPROM_AT25=m
 CONFIG_UACCE=m
 # CONFIG_SCSI_PROC_FS is not set
-- 
2.43.0.472.g3155946c3a-goog


