Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1BDD9CE25
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 26 Aug 2019 13:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727348AbfHZLbs (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 26 Aug 2019 07:31:48 -0400
Received: from inca-roads.misterjones.org ([213.251.177.50]:40099 "EHLO
        inca-roads.misterjones.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726558AbfHZLbs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Aug 2019 07:31:48 -0400
X-Greylist: delayed 2524 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Aug 2019 07:31:47 EDT
Received: from www-data by cheepnis.misterjones.org with local (Exim 4.80)
        (envelope-from <maz@kernel.org>)
        id 1i2CZC-0001Hc-8T; Mon, 26 Aug 2019 12:49:42 +0200
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 2/2] ARM: exynos: Enable support for ARM architected  timers
X-PHP-Originating-Script: 0:main.inc
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 26 Aug 2019 11:49:42 +0100
From:   Marc Zyngier <maz@kernel.org>
Cc:     <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20190826103142.3477-4-m.szyprowski@samsung.com>
References: <20190826103142.3477-1-m.szyprowski@samsung.com>
 <CGME20190826103203eucas1p2d67b0ef44758eb06252b340f7751701a@eucas1p2.samsung.com>
 <20190826103142.3477-4-m.szyprowski@samsung.com>
Message-ID: <d286053b6f4b4783d0638dc2dbd5858e@www.loen.fr>
X-Sender: maz@kernel.org
User-Agent: Roundcube Webmail/0.7.2
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: m.szyprowski@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, cw00.choi@samsung.com, b.zolnierkie@samsung.com, krzk@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org); SAEximRunCond expanded to false
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 2019-08-26 11:31, Marek Szyprowski wrote:
> ARM architected timer can be used together with Exynos MultiCore 
> Timer
> driver, so enable support for it. Support for ARM architected timers 
> is
> essential for enabling proper KVM support.

How can you say that this is to "enable KVM support", while in the 
previous
patch, you set "arm,cpu-registers-not-fw-configured" which implies that 
you're
booting in secure mode with the timer's CP15 registers left to 
undefined values?

         M.
-- 
Jazz is not dead. It just smells funny...
