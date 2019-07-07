Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAFDE61770
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  7 Jul 2019 22:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727465AbfGGUf5 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 7 Jul 2019 16:35:57 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41431 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbfGGUf4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 7 Jul 2019 16:35:56 -0400
Received: by mail-lf1-f66.google.com with SMTP id 62so9473418lfa.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Jul 2019 13:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=CPIJZQwW/FI43UGQYwYapti+p0y2P7uNM/osNJ5Hxk8=;
        b=gahvQpaWIVnkaAZoc+//PaCsSgRurVLckY2w7I4LNpHCVDud9gBWzCkPAOU69NLAKN
         J/SSFfuppAdsFvR6qrVUmaNTLy1SpY5tzhq/qRSKeJZExvY5qJitQbi0qQ2U5wlfCtYh
         KtGAB4tInFse1JnjnBpJP1Qbfbi3sEtRUGtvGbWvSyBPG1cp0k8XhOvInSPmwiugO305
         Tw1BLrJ3TT13txdkXWCqB636eFjv8e0FksmOxn+brXAB7uqDRapm/E3JBtpclOp6x/Dy
         S53Gp1wxDiaR8I2KGHpk4g+5m+8WUIiocjef9o3eg3m+tpBSzY1injl5jIYSYfC8UBqV
         wsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CPIJZQwW/FI43UGQYwYapti+p0y2P7uNM/osNJ5Hxk8=;
        b=PY633zHMa/ilrKym7iWrCdfxpfi/1DufrLrnep2PYng20CbtZAyhIRWFt8iAANoPLd
         4vYGhgosU2tHogAtHFlHKvTTyFEOquWLsecWrwlvZ+68Me6ngfkGTBDfcdTBcFiN0RdT
         NtVOEwsAu3iddFuf5ILSFtrBUM+qIws2Fspi/I3GWOXSvQxBEQenpPhF1msNAdGW2qCe
         FyUjPEH4TQx/L3ux595OPi7fNDuqGuQXPcXfhYcHnbuIqFebLRFEsdiPUq9soSb5n+Kh
         N3nU56t6gVN/KzTyt0jWirkBX0cwenylh8d3fxDJetZZXau3W1YnZ09etLFvQhUYtNbI
         VYwg==
X-Gm-Message-State: APjAAAU1dnrABIfWhiXK2yDKVNRU0Wf073YSrSo9385dDWRQXqj6PhAz
        XqrQrpXPvqg99eRzEd5GMH/Bcg==
X-Google-Smtp-Source: APXvYqzgu+JX9Cks72JMfNggltTrkkVHJCJTPY0I6PKNzLLFJfYrQrbIXgiYEzWPBVkoPSDnYTXDGQ==
X-Received: by 2002:ac2:5a5e:: with SMTP id r30mr6822454lfn.12.1562531755053;
        Sun, 07 Jul 2019 13:35:55 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id g5sm3197074ljj.69.2019.07.07.13.35.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Jul 2019 13:35:53 -0700 (PDT)
Date:   Sun, 7 Jul 2019 13:33:19 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] ARM: dts: exynos: Late pull for v5.3
Message-ID: <20190707203319.qqzeb2mwb65p7gn7@localhost>
References: <20190707180115.5562-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190707180115.5562-1-krzk@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, Jul 07, 2019 at 08:01:15PM +0200, Krzysztof Kozlowski wrote:
> Hi,
> 
> Late third pull of DTS changes, on top of previous pull request.
> This contains important fix for stuff merged recently, one cleanup
> and two minor fixups for regulators.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 13efd80acaa4cdb61fde52732178ff9eb4141104:
> 
>   ARM: dts: exynos: Add GPU/Mali 400 node to Exynos4 (2019-06-24 20:03:42 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.3-3
> 
> for you to fetch changes up to 841ed60264b3d37d5bf3e32cff168920e4923f88:
> 
>   ARM: dts: exynos: Adjust buck[78] regulators to supported values on Arndale Octa (2019-07-01 20:28:37 +0200)

Applied, thanks!


-Olof
