Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC964B3679
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 12 Feb 2022 17:37:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237370AbiBLQhP (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 12 Feb 2022 11:37:15 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236823AbiBLQhO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 12 Feb 2022 11:37:14 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D1A20F
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Feb 2022 08:37:11 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DE2B73F4B4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Feb 2022 16:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644683829;
        bh=tMqilUYIpgE4D+Oy8hol1pf8fg4uaneK2N51DubcZr4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=ZItwuzD09lFECDHyY7Jh94xxJnDEue0BlpC+AwW0hLGRumxMSw2Xen15f6RQM3FxI
         tCg2rwwbsAR2aGOkptGCEmT+lj+TZgncQJItCuye52I1ni9qt+uE9TyIThRLHc2zmg
         2uth7BfNPnzs4IY49plQHMv4YjU9NZQbeG8C8H5Ha0kXLfuYKUyTn3cf5npQYMuJZv
         Lvxf9lODEtbqCUvNZMQgyvWGYd+Nv4mvgJ29Sj7WjAHWq0iOZsismnrr55G6TkLmMF
         aNPfshGSa4pjdNwRaCXsO2goOYSelOG+crdqT9Pn9E2XP7/ZobfSiQ+YoNz2SWHOw9
         18B7JKGoE7Wuw==
Received: by mail-ed1-f71.google.com with SMTP id cr7-20020a056402222700b0040f59dae606so7324794edb.11
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Feb 2022 08:37:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tMqilUYIpgE4D+Oy8hol1pf8fg4uaneK2N51DubcZr4=;
        b=lebuDTpzqvkStTa9jQUSjpKd0EHOxQ/13c+bT1BrwV5xRBAHOLkZZAtCbA8S547lSS
         S7D2RPBxZ8witzFGtA3wg4BWiK3UbdS+L4AzQtVygIN3juTgF1ikKlJnWyoZ9v17EsRH
         TvKFqE9WnkIryUpHFbGsTZPdRexJDMKLAIJGyQfdJHt1kKokB9GUvJURYem63/q2kbX/
         +Fad9e1WEeNo0DFXQrl7okCKv7KOnbviqtSAoIdwTngwETy+aL1Z9Vz7iIsVJa4tG0pl
         bt51yhc5/aDMZrTVTjh62EYK1n50gzvzQMORgKSF9inkwcqS2KxOpcc6kLklQ1dOs/Pk
         cSKQ==
X-Gm-Message-State: AOAM532RcL84EfD3SYl9VpbybpRuVJFllYor2m0i1qDEp1dpzVllJdBW
        feUiaY54jksiGQpn0O0+1gdaOggqVUXHCoRqftOx6y6dIsKoHH0KTs+KzNY2sFblKmtD7YtGimz
        GHn04pPn06g+ZzHucV1Ll2jb9Ipbwnqfwm1jiZmwXkDDHtEMN
X-Received: by 2002:a17:907:c07:: with SMTP id ga7mr5546523ejc.536.1644683829509;
        Sat, 12 Feb 2022 08:37:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxD2vBUSSwJtNtb2tnnNYmZ8ce5zaQGnbpfOOmEuusMoNeqmKg6uKEeUXp4CHd4UHdvHqCobg==
X-Received: by 2002:a17:907:c07:: with SMTP id ga7mr5546511ejc.536.1644683829366;
        Sat, 12 Feb 2022 08:37:09 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id x10sm2494443edd.20.2022.02.12.08.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 08:37:08 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-phy@lists.infradead.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Vinod Koul <vkoul@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
        Inki Dae <inki.dae@samsung.com>, linux-kernel@vger.kernel.org
Cc:     stable@vger.kernel.org, Sylwester Nawrocki <snawrocki@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: (subset) [PATCH 01/10] ARM: dts: exynos: add missing HDMI supplies on SMDK5250
Date:   Sat, 12 Feb 2022 17:37:03 +0100
Message-Id: <164468382250.54495.17179167915023420156.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220208171823.226211-2-krzysztof.kozlowski@canonical.com>
References: <20220208171823.226211-1-krzysztof.kozlowski@canonical.com> <20220208171823.226211-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 8 Feb 2022 18:18:14 +0100, Krzysztof Kozlowski wrote:
> Add required VDD supplies to HDMI block on SMDK5250.  Without them, the
> HDMI driver won't probe.  Because of lack of schematics, use same
> supplies as on Arndale 5250 board (voltage matches).
> 
> 

Applied, thanks!

[01/10] ARM: dts: exynos: add missing HDMI supplies on SMDK5250
        commit: 60a9914cb2061ba612a3f14f6ad329912b486360

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
