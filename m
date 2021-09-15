Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B5540C0EE
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 15 Sep 2021 09:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236766AbhIOHw2 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 15 Sep 2021 03:52:28 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51232
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236702AbhIOHw0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Sep 2021 03:52:26 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C435C4026B
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 07:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631692266;
        bh=yfmyLGLaZHO2X3SIp2h1tQ0oSU6KsOx2ug/7Y4ecG1Y=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=GcSj10tYJ8+Z1OPk/51Elz8W7vfte/kCNMUqyRQML9yIUfv2Ywptkg+nBoDb0Lvw7
         3hlCVNaaQK/clFgOe3uOgiFRle86o/ii4ufCv8CtHtfFoR79US4ltbUnPr1PwVBT9O
         mVGMZMtD7+B1epDAVhVXLiPCy/NV8xQ2tGmGpQlG7gXUoC8mZqvvJV1VCS9NZ6HzGW
         aMpb/GbiqCQ/7ZcmraPgC1oU97ZTZLzQndIPlpLcMUmAkIDkeXtSOosuIPPKwQtSJk
         2VzdRNJlWE/FMyVWrwSYT0ZQNNJifWZld7fZzMKSDM+eP6U0lhyzfqS08EQ6ISFT+R
         Xgrhyn981HWtw==
Received: by mail-ed1-f71.google.com with SMTP id v13-20020a056402174d00b003c25d6b2f13so1111730edx.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Sep 2021 00:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yfmyLGLaZHO2X3SIp2h1tQ0oSU6KsOx2ug/7Y4ecG1Y=;
        b=kgs/H4eRSPkYgFepX3i76uWO96Coequ4vpmpzVxiGTkMOgWGgsTmsMyohyo+2SLV2D
         ou7u5AeMwgzvhczQpz7v3aphpdWx9lrtGoig2Cox5cBy3F1bb3W67eusDX5UCqczj8dS
         NM5pEIwWA1nGkWIFqolf9MdNu4rrcVMPm43xWTYygEARC+S/SZesCsCjKxgSAsfb7lq3
         VRrCOLSHNiPtl5Ay3+fQfNX8R7Eap/I6gfhfQPJX0mCxznRTfC++mXxbV2o6sTntV7Gm
         sU0PVOtPQ5PrHaZLce9VWmeRLq09OwYoqTF7GtVr2Ds77T1AHEAF9IIyFvwTR5UcSARX
         2qsw==
X-Gm-Message-State: AOAM533Tlu0jnKM4cWGd6bUwbGi7MfZr7uRq0lWm6fHAknQkmmTmYVBP
        P1UcCNT+1DUPBwLR73Qplta20Sn9bCcVujkWMmToN3yKo67+X05mmjCHh1imCOXXMsFs3WKnzMo
        w4arc4f5kGHBMOpv5C59l/grv5jDZ+jnzA28A2hmtDO9DWHGm
X-Received: by 2002:a17:906:1484:: with SMTP id x4mr23446554ejc.72.1631692266014;
        Wed, 15 Sep 2021 00:51:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOUoG/3APcqCn+ZeMkj7rfrYeSKawWs4kMluxJlwRm1ZVOU1UXmVKC+P6dzqxBWLZzMUXm7g==
X-Received: by 2002:a17:906:1484:: with SMTP id x4mr23446537ejc.72.1631692265892;
        Wed, 15 Sep 2021 00:51:05 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n11sm591922edr.51.2021.09.15.00.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 00:51:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 2/2] ARM: dts: exynos: drop undocumented samsung,sata-freq property in Exynos5250
Date:   Wed, 15 Sep 2021 09:50:57 +0200
Message-Id: <163169222223.16372.5968468091067814422.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811083859.28234-2-krzysztof.kozlowski@canonical.com>
References: <20210811083859.28234-1-krzysztof.kozlowski@canonical.com> <20210811083859.28234-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 11 Aug 2021 10:38:59 +0200, Krzysztof Kozlowski wrote:
> The samsung,sata-freq property is not used (and not documented by
> generic AHCI platform bindings), so can be safely dropped.
> 
> 

Applied, thanks!

[2/2] ARM: dts: exynos: drop undocumented samsung,sata-freq property in Exynos5250
      commit: 06cf9e0b1aae8ff4f4cee39126a415b2b173b986

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
