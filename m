Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74464168EC2
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 22 Feb 2020 13:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726883AbgBVMSB (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 22 Feb 2020 07:18:01 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:55012 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgBVMSA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 22 Feb 2020 07:18:00 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 6770D2008C;
        Sat, 22 Feb 2020 13:17:58 +0100 (CET)
Date:   Sat, 22 Feb 2020 13:17:56 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] drm/panel: ld9040: add MODULE_DEVICE_TABLE with SPI IDs
Message-ID: <20200222121756.GC28287@ravnborg.org>
References: <CGME20200220120711eucas1p1f3ac819081ece4847b17c10c005dfa42@eucas1p1.samsung.com>
 <20200220120700.12257-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200220120700.12257-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=hD80L64hAAAA:8
        a=zzRaUB44imW1Si3-isMA:9 a=CjuIK1q_8ugA:10
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marek.

On Thu, Feb 20, 2020 at 01:07:00PM +0100, Marek Szyprowski wrote:
> Add proper MODULE_DEVICE_TABLE structure with SPI IDs to allow proper
> creation of SPI modalias string and fix autoloading module for this driver.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks,

applied to drm-misc-next.

	Sam
