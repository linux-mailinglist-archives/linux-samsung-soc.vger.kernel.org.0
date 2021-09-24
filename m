Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 593EA4175F9
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 24 Sep 2021 15:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346418AbhIXNgu (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 24 Sep 2021 09:36:50 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59890
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346438AbhIXNgt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 09:36:49 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E68DD40790
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 13:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632490515;
        bh=v0f97v842v9qYVokMipR6acxJb0mTvy8VEiat1GXDFk=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=ce8C7P9jVwUn+jtdegCxntPN8raVAx3eLU09lsXvfwRuarIIXKHLOF6DlkkOFzXhp
         J6DLCXvw5qkCBLrf4qefcTB0wzmYzsAuRca/pmCx379cp6tCAMhIGc8zKkYoO+NPl3
         SBn+369iVUIrdjjn7n3dt9BS9MFyybJirxTod0RJjNxYF5yiFSdFWnALdoXgRmEnOT
         e1biCM0AnkdOtM2eo5Y/dYjgz8jra0yfJL7BvH2zjZcDB4NHYZkmTIlqJ6KO2MjKfL
         pqlkq+sK0PyqEZrrhEKEd8/clI0CiwL3KSAGwyjaBokKwCvbnHXyJUowmsjzlQdUom
         OnK00eDMkbAYw==
Received: by mail-wr1-f69.google.com with SMTP id u10-20020adfae4a000000b0016022cb0d2bso8059425wrd.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 06:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v0f97v842v9qYVokMipR6acxJb0mTvy8VEiat1GXDFk=;
        b=wwiomTLqiEmn7bnHRYnKa4HP+AyRPd53XEcAaUol1dppoAHY8HOV88wt/nnoQ/EKi/
         a13OwYnXnwoG+eg4AJGGKGJurFdjha/YDBSS23ScTOAvF/lbBlavL7906kzp9YoRK6GW
         H8D4ruowJy6MOBlWWMEQw67vM1i6qKMtytj9Py05VLewY82c/y/PfRojEQ328wKLKlPg
         oxSxGeXTlALei93xrXFcmyXTet4qAw7siiIB71oTi0cX2q856XarpfygALjRvcSslnuP
         UGmgCEFyf7SAfojvY5zz0iQTpVJka/9EX1bnNNqdamdh7cDVPNvhkdWXzlx8Zaka1B1G
         C3tQ==
X-Gm-Message-State: AOAM532gKIFxfKv5F+4ZwTXD10RKcVuv8rwB6REQqvqdEjYEDae4EKUJ
        4Sa4vA4taqTbEn6Kfx7senEVD8rvwgy7zEcN5lEtePUSpz2A4isEOrTo1FNtNLOMvmejit+Fr91
        fXmrdDWevtXWM3UcCmirVupVEdoJobAvmIDUsXLw/tc20E6+W
X-Received: by 2002:adf:f4c6:: with SMTP id h6mr866977wrp.397.1632490515242;
        Fri, 24 Sep 2021 06:35:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwi7xEv8Tz6BmCOASozjNG+54R6CSmRxyu2Kax3cZe6Cg23rAYqOmgddnFPEdP4Opy5ulirIw==
X-Received: by 2002:adf:f4c6:: with SMTP id h6mr866952wrp.397.1632490515106;
        Fri, 24 Sep 2021 06:35:15 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id 5sm8709997wmb.37.2021.09.24.06.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 06:35:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
        Georgi Djakov <djakov@kernel.org>, linux-pm@vger.kernel.org
Subject: [PATCH] interconnect: samsung: describe drivers in KConfig
Date:   Fri, 24 Sep 2021 15:34:40 +0200
Message-Id: <20210924133441.112263-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Describe better which driver applies to which SoC, to make configuring
kernel for Samsung SoC easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/interconnect/samsung/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/interconnect/samsung/Kconfig b/drivers/interconnect/samsung/Kconfig
index 6820e4f772cc..fbee87e379d0 100644
--- a/drivers/interconnect/samsung/Kconfig
+++ b/drivers/interconnect/samsung/Kconfig
@@ -6,8 +6,10 @@ config INTERCONNECT_SAMSUNG
 	  Interconnect drivers for Samsung SoCs.
 
 config INTERCONNECT_EXYNOS
-	tristate "Exynos generic interconnect driver"
+	tristate "Exynos SoC generic interconnect driver"
 	depends on INTERCONNECT_SAMSUNG
 	default y if ARCH_EXYNOS
 	help
-	  Generic interconnect driver for Exynos SoCs.
+	  Generic interconnect driver for Samsung Exynos SoCs (e.g. Exynos3250,
+	  Exynos4210, Exynos4412, Exynos542x, Exynos5433).
+	  Choose Y here only if you build for such Samsung SoC.
-- 
2.30.2

