Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E903E262835
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  9 Sep 2020 09:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgIIHQg (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 9 Sep 2020 03:16:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgIIHQd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 03:16:33 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84946C061573
        for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Sep 2020 00:16:33 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id z9so1249864wmk.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Sep 2020 00:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=sGSszLhzKyiLjIv2TvuHAJHM53/YBqm/b0KkCOpx610=;
        b=LC9b3CyHa+R4F3plgZXhFVK/O5MNI4/jydOr7NfHBXgFPf7qErTlaWo4TjBKIX3RdE
         huAyt4+vAiD1SDS9NzOdcbr799v5pvh/DbT7VsVSNA+mH3+95jm1to+wIFW4qAbMEpEV
         doou+cDepT3ERksbXeA6IPFmJYSk3QkxQtLHMjxPgyTr4UxE5EUgXZWPxOu6ch6SejoA
         OnlUs1TmoeDVwhG2/ieg4sU/CwcrbONYBwDyiYvaf2K/UAKE93/idEMOK8n8fzI7rfUw
         CvSBagnzWzUJ+UlRIkr4DlFPivrKfUwAsS/I5EVXdX/TYXYaQgjCENUC9r84crcc3QRl
         u6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=sGSszLhzKyiLjIv2TvuHAJHM53/YBqm/b0KkCOpx610=;
        b=FTSi2uzaDYDk7oz0A/kjKq9me2LxQQ9ytI/Pl0GEFVL5y3J+JNdet3pNFrR7LLj13z
         k7QGXb+4IC9xvrsYGhxirh8Eg7VHo+jW1XiX4B8Z2XYXy0958hkhIG6BXJJpQwlbu35S
         kC4hPkpaTA6i34xJQ80RGOEns4LIvpO6jFVcFE4JHMlTAWWtr3GlsQovEn+RX3EksO37
         FRZxit7CWoQGy7kTavDwpKyGM+K3TkhdVej/NZmQDk1v2UH7bJ+Cd18e293o9J2H7qpT
         5DlKz+NU/g/hqjWIQIr8wfND4lpo45kZ0CPkkcJHjR91X9CmX3pIB7iw6BpHAZ3vvAvw
         vmQA==
X-Gm-Message-State: AOAM531ix7UdtvWur9YKoi+skb2O1yn+QJOhVnfm/rFfh+pMw0Efjeb5
        hZvOS36HeoyyrGLkRt1lBF1DGg==
X-Google-Smtp-Source: ABdhPJydIVfptSYf06/9NqPzYVHQ82le5fWrzLb29ZxnelQM3KNpgZ6ZW50H2EH0XCDdkQEkiXscyA==
X-Received: by 2002:a1c:7314:: with SMTP id d20mr2057345wmb.76.1599635792247;
        Wed, 09 Sep 2020 00:16:32 -0700 (PDT)
Received: from dell ([91.110.221.179])
        by smtp.gmail.com with ESMTPSA id t15sm2430132wmj.15.2020.09.09.00.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 00:16:31 -0700 (PDT)
Date:   Wed, 9 Sep 2020 08:16:29 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: mfd: syscon: Document Exynos3 and
 Exynos5433 compatibles
Message-ID: <20200909071629.GA4400@dell>
References: <20200902161452.28832-1-krzk@kernel.org>
 <20200902161452.28832-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200902161452.28832-2-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 02 Sep 2020, Krzysztof Kozlowski wrote:

> Document Samsung Exynos3 and Exynos5433 compatibles for system
> registers.
> 
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Rebase on first patch
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
