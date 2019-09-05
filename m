Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 742D6AABF6
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Sep 2019 21:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbfIET3X (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 5 Sep 2019 15:29:23 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:40921 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbfIET3X (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 15:29:23 -0400
Received: by mail-wr1-f52.google.com with SMTP id w13so4081230wru.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Sep 2019 12:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UeXEO5wB9FLEBsxmMMVpwuE+ux98TxL2vsySrExnYqM=;
        b=nIpkcah4a9Su9pPRnoPCFpPbhrrdNUegOg0GaQfQFYCilzUHYDepg3y7Bes0ooXVL2
         NeVtcRM4JjMckFHRc1iAAyJLLk5UFbKXMM6HfR5kITpM8jjijr7mjYHC521AF6y+2KHl
         QZvzBauvH6AA/LjXeWpI0DDkieEbNS2Uvq7iEA0rsybnkWY6GBJKbBcKRjs6Z24bSKqG
         5Pdcm7/VP3rz2H5ozo4vW8nciHW1btjXnd5b3uEWnEyzsZee1xeETsZjaEWC96f5Bgnh
         qNgosCgEmWkwnFvbgiUC8Mj/bscoxCaaXhR/J4v8f3fUEc6OEtqEiOUpl17JC6cxSo+s
         aW2g==
X-Gm-Message-State: APjAAAUn+V4XTLun0d7e8/bemCXZ+sgb/q/w0JvMYYpjlR9L0qP3dXPl
        CDjceXwre7IYxTAI9Zh3Pdrl/yvM
X-Google-Smtp-Source: APXvYqxs/9aO1UVB8NO73vCntkaiCxPKXGPSaJ8TOuhfDQfnITAyIByzW+T7S8fnQGFV1RbB0aVvbA==
X-Received: by 2002:adf:d4c3:: with SMTP id w3mr3925177wrk.100.1567711761298;
        Thu, 05 Sep 2019 12:29:21 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id k9sm5996342wrd.7.2019.09.05.12.29.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2019 12:29:20 -0700 (PDT)
Date:   Thu, 5 Sep 2019 21:29:18 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH 0/3] arm64: dts: exynos: A few more fixes
Message-ID: <20190905192918.GA14046@kozik-lap>
References: <CGME20190904092449eucas1p28ec98275a95882948f4d298f15c15325@eucas1p2.samsung.com>
 <20190904092442.26260-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190904092442.26260-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 04, 2019 at 11:24:39AM +0200, Marek Szyprowski wrote:
> Dear All,
> 
> While fixing the issue reported by Alim Akhtar, I've noticed a few more
> issues in arm64/exynos dts files. This patchset fixes them.
> 
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland

Thanks, applied entire set.  There will be no next releases so
unfortunately this will not get wider coverage (unless someone tests my
for-next branch).

Best regards,
Krzysztof

