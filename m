Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDDA2CE230
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Dec 2020 23:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727533AbgLCWyD (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 3 Dec 2020 17:54:03 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:40590 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727760AbgLCWyD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 17:54:03 -0500
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 9B92F3A5787
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Dec 2020 22:53:20 +0000 (UTC)
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 64A4C1BF208;
        Thu,  3 Dec 2020 22:52:18 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/2] rtc: s3c: Disable all enable (RTC, tick) bits in the probe
Date:   Thu,  3 Dec 2020 23:52:17 +0100
Message-Id: <160703593364.102627.6281695169536420119.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201202111318.5353-1-m.szyprowski@samsung.com>
References: <CGME20201202111328eucas1p25b7a68b4fe94addf6088cc3ad4bedcf1@eucas1p2.samsung.com> <20201202111318.5353-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 2 Dec 2020 12:13:17 +0100, Marek Szyprowski wrote:
> Bootloader might use RTC hardware and leave it in the enabled state. Ensure
> that the potentially enabled periodic tick interrupts are disabled before
> enabling the driver, because they might cause lockup if tick interrupt
> happens after disabling RTC gate clock.

Applied, thanks!

[1/2] rtc: s3c: Disable all enable (RTC, tick) bits in the probe
      commit: 31b16d978f902bd9ac7fdc20738f67e39959cd5c
[2/2] rtc: s3c: Remove dead code related to periodic tick handling
      commit: ce9af89392024f57247187afc345991b784f9bae

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
