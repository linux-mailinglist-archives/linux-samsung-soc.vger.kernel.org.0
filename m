Return-Path: <linux-samsung-soc+bounces-39-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 732B27F3451
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 21 Nov 2023 17:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FC971F23081
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 21 Nov 2023 16:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6041537F8;
	Tue, 21 Nov 2023 16:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SQcNNBZM"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E4B1194;
	Tue, 21 Nov 2023 08:55:37 -0800 (PST)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1CE896607295;
	Tue, 21 Nov 2023 16:55:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700585735;
	bh=mdGg1nddgmW59PVR/+jB1h2IWASeId6LzRHfz+nJCBE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SQcNNBZMj0lhMZdq5kybwuucz82fO2JZBlE3rqS+k3sNJ4eYpyhOghO9QxM5aTbxT
	 MMZGUe/IwQ/GqLlfrWmBejzlKfT+Lqfdrc8gM/48xhRhT1ouGDE5tAThvSGUYuIVp8
	 PB2GfrNU+9FPg90MoDPrAesDOuenQ5S4qSvpLcIjuCB8VG6OJrbvN5yw1MmK9onImx
	 d0faVeghkmsnKUJYbdRnSjRseFejp7z05WAxR+Qiddu2Y067NUOpS38eFcjb2bGCTe
	 8xcuaBPqX3dQjnkEGLAcX+SPog4So8TlnK3wHPlpQqGGbxITfrtgbqORUBMIYDZ7Q+
	 1Ah5AaqHiph5Q==
Date: Tue, 21 Nov 2023 17:55:31 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Steven Price
 <steven.price@arm.com>, tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 mripard@kernel.org, dri-devel@lists.freedesktop.org, wenst@chromium.org,
 kernel@collabora.com, "linux-samsung-soc@vger.kernel.org"
 <linux-samsung-soc@vger.kernel.org>, Marek Szyprowski
 <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/panfrost: Really power off GPU cores in
 panfrost_gpu_power_off()
Message-ID: <20231121175531.085809f5@collabora.com>
In-Reply-To: <6b7a4669-7aef-41a7-8201-c2cfe401bc43@collabora.com>
References: <20231102141507.73481-1-angelogioacchino.delregno@collabora.com>
	<7928524a-b581-483b-b1a1-6ffd719ce650@arm.com>
	<1c9838fb-7f2d-4752-b86a-95bcf504ac2f@linaro.org>
	<6b7a4669-7aef-41a7-8201-c2cfe401bc43@collabora.com>
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

On Tue, 21 Nov 2023 17:11:42 +0100
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
wrote:

> Il 21/11/23 16:34, Krzysztof Kozlowski ha scritto:
> > On 08/11/2023 14:20, Steven Price wrote:  
> >> On 02/11/2023 14:15, AngeloGioacchino Del Regno wrote:  
> >>> The layout of the registers {TILER,SHADER,L2}_PWROFF_LO, used to request
> >>> powering off cores, is the same as the {TILER,SHADER,L2}_PWRON_LO ones:
> >>> this means that in order to request poweroff of cores, we are supposed
> >>> to write a bitmask of cores that should be powered off!
> >>> This means that the panfrost_gpu_power_off() function has always been
> >>> doing nothing.
> >>>
> >>> Fix powering off the GPU by writing a bitmask of the cores to poweroff
> >>> to the relevant PWROFF_LO registers and then check that the transition
> >>> (from ON to OFF) has finished by polling the relevant PWRTRANS_LO
> >>> registers.
> >>>
> >>> While at it, in order to avoid code duplication, move the core mask
> >>> logic from panfrost_gpu_power_on() to a new panfrost_get_core_mask()
> >>> function, used in both poweron and poweroff.
> >>>
> >>> Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
> >>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>  
> > 
> > 
> > Hi,
> > 
> > This commit was added to next recently but it causes "external abort on
> > non-linefetch" during boot of my Odroid HC1 board.
> > 
> > At least bisect points to it.
> > 
> > If fixed, please add:
> > 
> > Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > [    4.861683] 8<--- cut here ---
> > [    4.863429] Unhandled fault: external abort on non-linefetch (0x1008) at 0xf0c8802c
> > [    4.871018] [f0c8802c] *pgd=433ed811, *pte=11800653, *ppte=11800453
> > ...
> > [    5.164010]  panfrost_gpu_irq_handler from __handle_irq_event_percpu+0xcc/0x31c
> > [    5.171276]  __handle_irq_event_percpu from handle_irq_event+0x38/0x80
> > [    5.177765]  handle_irq_event from handle_fasteoi_irq+0x9c/0x250
> > [    5.183743]  handle_fasteoi_irq from generic_handle_domain_irq+0x28/0x38
> > [    5.190417]  generic_handle_domain_irq from gic_handle_irq+0x88/0xa8
> > [    5.196741]  gic_handle_irq from generic_handle_arch_irq+0x34/0x44
> > [    5.202893]  generic_handle_arch_irq from __irq_svc+0x8c/0xd0
> > 
> > Full log:
> > https://krzk.eu/#/builders/21/builds/4392/steps/11/logs/serial0
> >   
> 
> Hey Krzysztof,
> 
> This is interesting. It might be about the cores that are missing from the partial
> core_mask raising interrupts, but an external abort on non-linefetch is strange to
> see here.

I've seen such external aborts in the past, and the fault type has
often been misleading. It's unlikely to have anything to do with a
non-linefetch access, but it might be caused by a register access after
the clock or power domain driving the register bank has been disabled.
The following diff might help validate this theory. If that works, we
probably want to make sure we synchronize IRQs before disabling in the
suspend path.

--->8---
diff --git a/drivers/gpu/drm/panfrost/panfrost_regs.h b/drivers/gpu/drm/panfrost/panfrost_regs.h
index 55ec807550b3..98df66e5cc9b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_regs.h
+++ b/drivers/gpu/drm/panfrost/panfrost_regs.h
@@ -34,8 +34,6 @@
          (GPU_IRQ_FAULT                        |\
           GPU_IRQ_MULTIPLE_FAULT               |\
           GPU_IRQ_RESET_COMPLETED              |\
-          GPU_IRQ_POWER_CHANGED                |\
-          GPU_IRQ_POWER_CHANGED_ALL            |\
           GPU_IRQ_PERFCNT_SAMPLE_COMPLETED     |\
           GPU_IRQ_CLEAN_CACHES_COMPLETED)
 #define GPU_IRQ_MASK_ERROR                     \



