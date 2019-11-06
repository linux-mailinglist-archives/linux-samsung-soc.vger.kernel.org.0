Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF8EF2232
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  6 Nov 2019 23:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbfKFWzp (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 6 Nov 2019 17:55:45 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33677 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbfKFWzp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 17:55:45 -0500
Received: by mail-pf1-f196.google.com with SMTP id c184so323534pfb.0;
        Wed, 06 Nov 2019 14:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=G+wFREXzWnU4DvNTPp24jRK6gxHaykXaWaMf/sx6ATg=;
        b=sQ8u9vvIMRJf/YRh3VYojixHYcKYtO2hDLWFvoBsS1PBHFg/h1LMjfvuvA+MeHpCwO
         z0cYS3YDplgMo3ZOvyj3aIu1iOohF67yhFhi2BSpVa1gupulIVDtO1k6fSdRgycnq4DR
         vcjB3h5zVLU3NTAd7yG/6A8mH7HCZ0mavsOtztbRf/h+FjUU9fLzeeeDAkEsBcTN56hB
         ixl/a+6c/Iht17p57N5o2Fhu1aLmrXhyaIECJprL13cFse6oqwyYsTQLhsvvahpoPUye
         kiOdc9bbwFzYjyeHPozlIDbM0IAyYLQ8KkgY5jjQuq9Mf2VKZDOvZ9KzgeI1Rm+jhu4f
         PNAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=G+wFREXzWnU4DvNTPp24jRK6gxHaykXaWaMf/sx6ATg=;
        b=HpIZC9HcsdzjxY+JY36y7SLN0ZICxQ7SEMCEepEXGgLhX7ma0wU91LixgBIU3Bz3Kn
         kx5EaQ2+GrHpy6Hz/oAeSIK9TzkFEak2R+rpjXmQBwKuRrlGF/7YTHcrKGzhrKiMlWHn
         +QbvMUPurZmva64M8xVH63T21UI9QwfYOP6eUjiH10Nh2pLX3V2cwDBJeGkuY9m38YOC
         JFXSEZzWbPeSSnxCaCmkTO1PUbdBDueNOBEeS0+JR1C4ERa/0Z6apdAiOY8IukqIF01D
         B0FKWm1DTkW+YKmnpuDdK3AyW5pOLNKATIvGtd4fMJolsYimATNOslHx586P4dwyQFCH
         U+kw==
X-Gm-Message-State: APjAAAWQAWz8tZvIxOQ74lj4r9W3/9gk4znD+X/o1YNx4Pps0GW5il+I
        8maTiSXyKCfVd3l86ytWokRb/KnfjGE=
X-Google-Smtp-Source: APXvYqyaoeXNjSP+cOcTd1+Pef9OXAz58l73/P12AfKh1CNDX+T7GpCBHH0Cbcg72NdkgL3tdtoorg==
X-Received: by 2002:aa7:8edd:: with SMTP id b29mr6491872pfr.23.1573080943671;
        Wed, 06 Nov 2019 14:55:43 -0800 (PST)
Received: from odroid.ad.adelaide.edu.au (staff-249-202.wireless.adelaide.edu.au. [129.127.249.202])
        by smtp.googlemail.com with ESMTPSA id y16sm32851pfo.62.2019.11.06.14.55.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Nov 2019 14:55:43 -0800 (PST)
From:   Marian Mihailescu <mihailescu2m@gmail.com>
To:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, kgene@kernel.org
Cc:     Marian Mihailescu <mihailescu2m@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: gpu: mali-midgard: add samsung exynos 5420 compatible
Date:   Thu,  7 Nov 2019 09:25:26 +1030
Message-Id: <20191106225527.9121-1-mihailescu2m@gmail.com>
X-Mailer: git-send-email 2.14.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add "samsung,exynos5420-mali" binding

Signed-off-by: Marian Mihailescu <mihailescu2m@gmail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
index 47bc1ac36426..41b928bce4ea 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
@@ -38,9 +38,12 @@ properties:
           - enum:
              - samsung,exynos5433-mali
           - const: arm,mali-t760
+      - items:
+          - enum:
+             - samsung,exynos5420-mali
+          - const: arm,mali-t628
 
           # "arm,mali-t624"
-          # "arm,mali-t628"
           # "arm,mali-t830"
           # "arm,mali-t880"
 
-- 
2.14.1

