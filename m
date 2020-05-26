Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5C3A19C1D4
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  2 Apr 2020 15:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388322AbgDBNLr (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 2 Apr 2020 09:11:47 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:45202 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732262AbgDBNLr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Apr 2020 09:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=neWmpBaTCRzgvC5RnHDeEfc0nV2vBJLslYFOXDTjpJk=; b=GfXyZcO31CeVTBTHHUjISz2Ra
        1/sk9nlEYINhahrMXRnJtAmOi+G9s+/5oL4lZEq28ZOhN/plLQpoklP53VIs73rSrcgMzvjESrQeD
        rgieyxpA50KCE7oIbhMZpFKY3hevMHDxSgQvM1AtsHaaX0VzJVpMCNXi+Xh8NVjlAPIED4rWJ2Ypx
        PU8XVxxQFN69FxfXJLUc/1KcTIt/bPPH+Fmt10GdUv/CQuutOKv8nKvyNYn04CrMhDEfasjdZ+WU0
        1bpaIluTJrrCicy+RXmjeUWbNRXvOIwOfIiXDOOBYTLwA7+tI0Fi0CN0MWdqI6CnaMPahTWwLEuE1
        lbVJtjkpg==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:40558)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jJzdH-0003Nj-RU; Thu, 02 Apr 2020 14:11:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jJzdH-0001ij-A8; Thu, 02 Apr 2020 14:11:43 +0100
Date:   Thu, 2 Apr 2020 14:11:43 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>, kernel@collabora.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: exynos: update l2c_aux_mask to fix alert message
Message-ID: <20200402131143.GZ25745@shell.armlinux.org.uk>
References: <b29f34870380093e6268c11d3033033d6def61b7.1585756648.git.guillaume.tucker@collabora.com>
 <20200401163101.GV25745@shell.armlinux.org.uk>
 <35c7cf4b-e6b8-43aa-d934-4a1c2e738372@collabora.com>
 <20200402130352.GY25745@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402130352.GY25745@shell.armlinux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Apr 02, 2020 at 02:03:52PM +0100, Russell King - ARM Linux admin wrote:
> On Thu, Apr 02, 2020 at 01:13:24PM +0100, Guillaume Tucker wrote:
> > On 01/04/2020 17:31, Russell King - ARM Linux admin wrote:
> > > On Wed, Apr 01, 2020 at 05:08:03PM +0100, Guillaume Tucker wrote:
> > >> Allow setting the number of cycles for RAM reads in the pl310 cache
> > >> controller L2 auxiliary control register mask (bits 0-2) since it
> > >> needs to be changed in software.  This only affects exynos4210 and
> > >> exynos4412 as they use the pl310 cache controller.
> > >>
> > >> With the mask used until now, the following warnings were generated,
> > >> the 2nd one being a pr_alert():
> > >>
> > >>   L2C: platform modifies aux control register: 0x02070000 -> 0x3e470001
> > >>   L2C: platform provided aux values permit register corruption.
> > >>
> > >> This latency cycles value has always been set in software in spite of
> > >> the warnings.  Keep it this way but clear the alert message about
> > >> register corruption to acknowledge it is a valid thing to do.
> > > 
> > > This is telling you that you are doing something you should not be
> > > doing.  The L2C controller should be configured by board firmware
> > > first and foremost, because if, for example, u-boot makes use of the
> > > L2 cache, or any other pre-main kernel code (in other words,
> > > decompressor) the setup of the L2 controller will be wrong.
> > > 
> > > So, NAK.
> > 
> > OK thanks, I guess I misinterpreted the meaning of the error
> > message.  It's really saying that the register value was not the
> > right one before the kernel tried to change it.  Next step for me
> > is to look into U-Boot.
> 
> The message "L2C: platform provided aux values permit register
> corruption." means that bits are set in both the mask and the value
> fields.  Since the new value is calculated as:
> 
> 	old = register value;
> 	new = old & mask;
> 	new |= val;
> 
> If bits are set in both "mask" and "val" for a multi-bit field, the
> value ending up in the field may not be what is intended.  Consider
> a 5-bit field set initially to 10101, and the requested value is
> 01000 with a mask of 11111.  What you end up with is not 01000, but
> 11101.  Hence, register corruption.  It is not possible to easily
> tell whether the mask and values refer to a multi-bit field or not,
> so the mere fact that bits are set in both issues the alert.
> 
> The message "L2C: platform modifies aux control register ..." means
> that you're trying to modify the value of the auxiliary control
> register, which brings with it the problems I stated in my previous
> email; platform configuration of the L2C must be done by firmware and
> not the kernel for the reasons I've set out.

Actually, looking at the values there:

        .l2c_aux_val    = 0x3c400001,
-       .l2c_aux_mask   = 0xc20fffff,
+       .l2c_aux_mask   = 0xc20ffff8,

Bit 0 is L310_AUX_CTRL_FULL_LINE_ZERO feature bit, which platforms have
no business fiddling with - it is a Cortex-A9/L2C310 specific feature
that needs both ends to be configured correctly to work.  The L2C code
knows this and will deal with it.  So, .l2c_aux_val should drop setting
bit 0.

It's also setting L310_AUX_CTRL_NS_LOCKDOWN, which the kernel already
deals with - this bit should be dropped as well.

It's clearing L310_AUX_CTRL_CACHE_REPLACE_RR - this should be setup by
firmware.

For the prefetching, I thought there were DT properties for that.
Please look at that, and see whether you can eliminate most of the
.l2c_aux_val field set bits, and the .l2c_aux_mask clear bits.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
