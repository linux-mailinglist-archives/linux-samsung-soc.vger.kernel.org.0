Return-Path: <linux-samsung-soc+bounces-2827-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 568E98AF84D
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Apr 2024 22:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8803D1C24169
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Apr 2024 20:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A3114389D;
	Tue, 23 Apr 2024 20:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lj/CgTBX"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9850143868
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 20:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713905418; cv=none; b=gPAkavvyANtQSI0fouGjS1Ype19iX7L/+O+BGoe0JqJu8N7ElX/9oETpf5SJrwuiONtyQWSqX/BT7t0dHu6HZmdQH/DQcw5Nq6Fs1RbGbEKzQmKOaBhKTCoOOlY22yoDGFAN+2uwUtqwOdTxqjcJmRQxQuzlAr17Q2JYmCPHWE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713905418; c=relaxed/simple;
	bh=WARBLKc8IIwkOZR1KT6Pc8Nf7x5S3Qw6DwX2PgELUbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CW3zBpREseUs/8kWrPMm3x0u+VQevnr5g10DUFw+D9+kqKgQR5+hBQVaOFi1I0grUW23N+LrqEpVKldE8hsy7TMEYq3e7irw3BQQOFrA5Ccvx3ssiVX9NoX3s0FVW8e1ndXfKyxIzZx/xIjPcyRIu7myL7VsHIEViU5HcPoqHNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lj/CgTBX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41a72f3a1edso20058545e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 13:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713905415; x=1714510215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7YOs9puuo8onPpvdQ4CfanEhu1eADekMseFBdt3Sao=;
        b=lj/CgTBXWD5CQMfW4dzCG4gJ6scB6ECUYUscs8fay/vFE0fR3JZRJ5l07Ai4gxO5/q
         wyzHUTJ1lpwBRc5niZ7M/66a1t+GE73GuSp+DCLRSNRSF4ykHIdYqUq6Y0E/S7wMDM8b
         LUxXhfF5+YlO7zQzsc/Sjihh70NDrq079eS3WYyR22lMfAKJ8TDMbw6qg8oRvuUc7h0k
         HIeZWcoUYnTyGOQ0pCFSjTBEJqnGH2w63T8V153+dNTFuGgF4bO6QEVn6/ARlkcZ2ch7
         ZI99JVXs5akUTQPO2jiiILFm7qV1Zpeyj5O0eglSfZTRZZzFV/tKA0bqtOgHfj0fSLRI
         7qPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713905415; x=1714510215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7YOs9puuo8onPpvdQ4CfanEhu1eADekMseFBdt3Sao=;
        b=ApMT4asleA1GIeXNBPqI2zRKeund9QR8RjlWCfAS4ngBSWVTr8kpJ8TAgC4Cr0RCJk
         LOum1SHEcO+LlbUMQpUGF94KyKl9ruYncQggFyJvTHPPqovfqBfBDru3nacOT3wpfDJl
         8tEx1v5hpPd//eDZPUgYzqw6xtZ251v/LRTZRKMREzDIXHLmVy2+oYZ5ooVSm6Azo0iS
         Q2aHz5sJOzROu39ShdFv6JEzEXxq2e41Gnm337uC8gHUo3MJgNtBBXqI4Al8aPyM3B6i
         FPkYrJlKLqnSxPjPOMCc/Mxf6LNIPGAYik2TOqIbzoVvtmF3mH8W2rdV1lP+KygEOMAW
         6qQA==
X-Forwarded-Encrypted: i=1; AJvYcCWylD/lOMUl4ybTlfoFrpbWdK8UGDCYp5/44o3UN1YOLWkAwrMGwRs5eWikeQNKHjPh96MK035UDSE039S75IrAI3+TIgLwOIAKata6KdikcZE=
X-Gm-Message-State: AOJu0Yx+GlZofiqdP0UKmHyo1CwmUZWM+FpVtSdVSGzU/K8EQV6zg0Pa
	pClSg6H2O0gtR+0TCtawvK3a2TqHivtgu6bil7dskOx1CFg6StNvQjKNfAZAb0M=
X-Google-Smtp-Source: AGHT+IH9p7rRQpyh3qjFY22JgIFm5zaFqK/Hn2YUUXTMJfPhSR4r4a+glqPpxsEltfaY8s2J4KBqIg==
X-Received: by 2002:a05:600c:3ba7:b0:416:9f45:e639 with SMTP id n39-20020a05600c3ba700b004169f45e639mr225716wms.20.1713905415398;
        Tue, 23 Apr 2024 13:50:15 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:4269:2542:5a09:9ca1])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b00419f419236fsm13065443wmb.41.2024.04.23.13.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 13:50:15 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	James.Bottomley@HansenPartnership.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 02/14] dt-bindings: soc: google: exynos-sysreg: add dedicated hsi2 sysreg compatible
Date: Tue, 23 Apr 2024 21:49:54 +0100
Message-ID: <20240423205006.1785138-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240423205006.1785138-1-peter.griffin@linaro.org>
References: <20240423205006.1785138-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update dt schema to include the gs101 hsi2 sysreg compatible.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: André Draszik <andre.draszik@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index c0c6ce8fc786..3ca220582897 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - google,gs101-apm-sysreg
+              - google,gs101-hsi2-sysreg
               - google,gs101-peric0-sysreg
               - google,gs101-peric1-sysreg
               - samsung,exynos3-sysreg
@@ -72,6 +73,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-hsi2-sysreg
               - google,gs101-peric0-sysreg
               - google,gs101-peric1-sysreg
               - samsung,exynos850-cmgp-sysreg
-- 
2.44.0.769.g3c40516874-goog


