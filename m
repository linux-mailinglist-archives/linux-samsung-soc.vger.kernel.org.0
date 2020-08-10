Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768DB2405D4
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 10 Aug 2020 14:25:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgHJMZc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 10 Aug 2020 08:25:32 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45738 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgHJMZb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 08:25:31 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 0840B2935C0
Subject: Re: [PATCH 1/3] ARM: exynos: clear L220_AUX_CTRL_NS_LOCKDOWN in
 default l2c_aux_val
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        kernel@collabora.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <860eb8a1eed879e55daf960c96acdac514cbda93.1596028601.git.guillaume.tucker@collabora.com>
 <20200803133439.GB476@kozik-lap>
 <20200803142244.GO1551@shell.armlinux.org.uk>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <875ad268-d65c-673e-6f5a-76d48c24f478@collabora.com>
Date:   Mon, 10 Aug 2020 13:25:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803142244.GO1551@shell.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/08/2020 15:22, Russell King - ARM Linux admin wrote:
> On Mon, Aug 03, 2020 at 03:34:39PM +0200, Krzysztof Kozlowski wrote:
>> On Wed, Jul 29, 2020 at 02:47:31PM +0100, Guillaume Tucker wrote:
>>> The L220_AUX_CTRL_NS_LOCKDOWN flag is set during the L2C enable
>>> sequence.  There is no need to set it in the default register value,
>>> this was done before support for it was implemented in the code.  It
>>> is not set in the hardware initial value either.
>>>
>>> Clean this up by removing this flag from the default l2c_aux_val, and
>>> add it to the l2c_aux_mask to print an alert message if it was already
>>> set before the kernel initialisation.
>>>
>>> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
>>> ---
>>>  arch/arm/mach-exynos/exynos.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> Makes sense. I'll take it after the merge window.
> 
> Yes, because platforms actually have no control over this bit through
> these values.
> 
> Please fix the description to use the right define, it's
> L310_AUX_CTRL_NS_LOCKDOWN not L220_AUX_CTRL_NS_LOCKDOWN.

Thanks, fixed in v2.

Guilaume

