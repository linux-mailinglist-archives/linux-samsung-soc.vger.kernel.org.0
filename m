Return-Path: <linux-samsung-soc+bounces-65-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC377F4126
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 22 Nov 2023 10:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 796FDB20D04
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 22 Nov 2023 09:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DF43B7B0;
	Wed, 22 Nov 2023 09:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="aB52ZCl4"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22D7E213C;
	Wed, 22 Nov 2023 01:02:06 -0800 (PST)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 70A1B6602F2B;
	Wed, 22 Nov 2023 09:02:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700643725;
	bh=G4M7wDZHayCxesxTfRg++DWT7lHVVmRMXfKWDXC3LAI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aB52ZCl42Hv76P2sb3thYE2yjQO6Oyyh2aV3uNzvBv9fwR7jnFRTSv9LukLH017hT
	 xXMQAvN35fIqPUtUyErl4nm2C4LUnIzxfRXCQquoxfkuPTaT4lLdKEE4TmjZ8qCMCy
	 E354LdefcIAgS+jwr7SP5XDk2378Lp2obv+UibFjHUkxa116RZQ6ifJGhXZffsxkJq
	 44v6vKyX5EDVKTM1GXVYCgziUjwCpzP9No2TIs8xtJcpMdx1v55pQZGoyvtbVSeMJi
	 815ZI5w5eKjaCENJMkIlE6Id3C6iIO1fymbL1f8VSRAnQVh0c/97pmC2J4Poh2FmVd
	 Mp4hB7RRfm8IA==
Date: Wed, 22 Nov 2023 10:02:01 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Steven Price <steven.price@arm.com>, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, wenst@chromium.org, kernel@collabora.com,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/panfrost: Really power off GPU cores in
 panfrost_gpu_power_off()
Message-ID: <20231122100201.4e9952be@collabora.com>
In-Reply-To: <d95259b8-10cf-4ded-866c-47cbd2a44f84@linaro.org>
References: <20231102141507.73481-1-angelogioacchino.delregno@collabora.com>
	<7928524a-b581-483b-b1a1-6ffd719ce650@arm.com>
	<1c9838fb-7f2d-4752-b86a-95bcf504ac2f@linaro.org>
	<6b7a4669-7aef-41a7-8201-c2cfe401bc43@collabora.com>
	<20231121175531.085809f5@collabora.com>
	<d95259b8-10cf-4ded-866c-47cbd2a44f84@linaro.org>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Nov 2023 18:08:44 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> > non-linefetch access, but it might be caused by a register access after
> > the clock or power domain driving the register bank has been disabled.
> > The following diff might help validate this theory. If that works, we
> > probably want to make sure we synchronize IRQs before disabling in the
> > suspend path.
> >   
> > --->8---  
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
> > index 55ec807550b3..98df66e5cc9b 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_regs.h
> > +++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
> > @@ -34,8 +34,6 @@
> >           (GPU_IRQ_FAULT                        |\
> >            GPU_IRQ_MULTIPLE_FAULT               |\
> >            GPU_IRQ_RESET_COMPLETED              |\
> > -          GPU_IRQ_POWER_CHANGED                |\
> > -          GPU_IRQ_POWER_CHANGED_ALL            |\  
> 
> This helped, at least for this issue (next-20231121). Much later in
> user-space boot I have lockups:
> watchdog: BUG: soft lockup - CPU#4 stuck for 26s! [kworker/4:1:61]

Hm, if this doesn't happen with "drm/panfrost: Really power off GPU
cores in panfrost_gpu_power_off()" reverted, it might be related to the
issue Angelo was describing, though I'd expect it to lead to job
timeouts, not the sort of soft lockup reported here.

> 
> [   56.329224]  smp_call_function_single from
> __sync_rcu_exp_select_node_cpus+0x29c/0x78c
> [   56.337111]  __sync_rcu_exp_select_node_cpus from
> sync_rcu_exp_select_cpus+0x334/0x878
> [   56.344995]  sync_rcu_exp_select_cpus from wait_rcu_exp_gp+0xc/0x18
> [   56.351231]  wait_rcu_exp_gp from process_one_work+0x20c/0x620
> [   56.357038]  process_one_work from worker_thread+0x1d0/0x488
> [   56.362668]  worker_thread from kthread+0x104/0x138
> [   56.367521]  kthread from ret_from_fork+0x14/0x28
> 
> But anyway the external abort does not appear.

Thanks for testing! As I said in my previous reply, I think the proper
fix for this particular issue would be to mask all panfrost IRQs
(writing 0 to xxx_INT_MASK) + call synchronize_irq() from
panfrost_device_suspend(), to make sure pending interrupts are flushed
and the handlers can't be called again (or at least not with real
interrupts to process, if the IRQ line is shared) until the device is
resumed.

FWIW, after fighting with annoying bugs in the interrupt handling logic
and its interactions with runtime PM, I've decided to automate some of
this in panthor [1]. Also made the power on/off logic generic [2], with
macros to allow powering on/off specific blocks. Not saying we should
do that in panfrost, just posting it as a reference, in case someone is
interested.

[1]https://gitlab.freedesktop.org/bbrezillon/linux/-/blob/panthor-v3+rk3588/drivers/gpu/drm/panthor/panthor_device.h?ref_type=heads#L279
[2]https://gitlab.freedesktop.org/bbrezillon/linux/-/blob/panthor-v3+rk3588/drivers/gpu/drm/panthor/panthor_gpu.c?ref_type=heads#L279
[3]https://gitlab.freedesktop.org/bbrezillon/linux/-/blob/panthor-v3+rk3588/drivers/gpu/drm/panthor/panthor_gpu.h?ref_type=heads#L24

