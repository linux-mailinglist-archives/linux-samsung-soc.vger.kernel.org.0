Return-Path: <linux-samsung-soc+bounces-1533-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 554F8841320
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Jan 2024 20:16:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 487451C240C1
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Jan 2024 19:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3A64C63A;
	Mon, 29 Jan 2024 19:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YebaDAKh"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F1C335B5
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 19:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706555791; cv=none; b=f7OPB6ZcWYsfiQeB2w8l19t/LxrvuQi3ftPtN+drjDQkzNdCgl7vV+EVm7gbxgbOZyWXlDkv5L2BDr4+QfUZiUbRZMC9nAKp9Zg4OHsGTKXYV7387F+97+5Pt+eV0E0/GSKS5GaDZqLnnv0CTi5UwP/qVomy4omMIxLp0QU3fOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706555791; c=relaxed/simple;
	bh=Qayk4ythZqaRbfuOzKrPm9wdDeQ7kDu33Z22nbx/cgo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dKwAvr/8K0xeBNeCpU0vRZ4ypmyMOt9oQjkVcVpHPI8gITOvbzJbLWRpxYqyH5J1e68SVlqGfGdzJTb4FGn4JqutoyqD8/89zApEPx23tqtEQ1A+86eN5I2gu+rjbSh9/x3WNBgM+MErOEHgTea4yt9Hcvch8DbJ0uDH03OAc6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YebaDAKh; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so2487664a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 11:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706555787; x=1707160587; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=we14nktryRJy2wvi6XVLgSirq+hDUDJitZ06Eruhqe0=;
        b=YebaDAKhe4fCjHGyx5SmchouOSJfHFGcq/cDNQJ7HvXtwn2MYgUXPWX4hHmQaE7gtY
         a8m/K10KSHKhuNbq/RgvvpNjyVsyKg7cz3S4KWjlfOig7OMnJaR/Q64d1+Ececo/BXLa
         YsJaI07kcU4l+/UvQpkyGJWVCTqkCiRLRRJzrAg4igbp+Mrkh1DTS7nyk8XxMEqNgzOF
         dgJMoYFzaUHVDQMXlkQvZfSzyrSKspDPwVfzb9Dq4zjTBBUOgAonvBEQhi4A5uYpxQ3X
         golVVYGKXRJHgqHmt8+utkWEG4fINV0y7XFDYngqCoT5QI5e3lPxoFCvbjh112vHZb07
         3RVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706555787; x=1707160587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=we14nktryRJy2wvi6XVLgSirq+hDUDJitZ06Eruhqe0=;
        b=ao5EVe7UIRBs6a4BaBjcgQU/gIWoOizyJVk7lUXoG5CWNM/ALQJGnP97qkHYdJznRS
         G/iuy6lsYsRD/cQRTq/gmzgLphuzOUn8ZXXLxBcPYVvmaCsYaDnqzdLJaYF2A9//ejK1
         Z4BOV203cO6MU5scpZJarOxwjsc4vOGCOOLycc5QJHicuYu1pcbZVKpuLKJGghH5Ayy3
         6ArTgBXyy9dDvVPe3mYly44/qZfaFx+bjTFOuEKQ7B909KqtOYUwaXP65Li+Qizy1EeF
         uNTXvmOOqX9hgSwmBnkqtIl3EJTBYoQ1uLsjQvyfZ/j3aa6GLZdAC91UTs86Fi1exZUA
         HKmQ==
X-Gm-Message-State: AOJu0YwiFF3FmCYQzaIQ7U1yy2l+gQQ/CTsYkAmliPhI/x6jUK96VCvj
	o+m6TIqBWH308iR9DOoGl32s4q7GT2LkT+0XT0VUpnD5z/X7ZrhDI5TzNbo8VYZigKEJgdsMwU6
	2vDEfCu5U144UZK5Fjf6/V7ehZk4ln62/ndmMdw==
X-Google-Smtp-Source: AGHT+IETcxJeom82cOjcjhkTNG+N6vPXPjaw3ncehNOVSjCswTqHGZvADR2UV+/I/BOd70NRgztfNVdIZx+uB/myjEI=
X-Received: by 2002:a05:6a21:2d8c:b0:19c:a0d4:bc93 with SMTP id
 ty12-20020a056a212d8c00b0019ca0d4bc93mr4213894pzb.31.1706555787440; Mon, 29
 Jan 2024 11:16:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127003607.501086-1-andre.draszik@linaro.org>
 <20240127003607.501086-6-andre.draszik@linaro.org> <CAPLW+4mL1gb_R8PhKaMhwOUTa0GDqat_9W=348ScYj+hBarQJg@mail.gmail.com>
 <d45de3b2bb6b48653842cf1f74e58889ed6783ae.camel@linaro.org>
In-Reply-To: <d45de3b2bb6b48653842cf1f74e58889ed6783ae.camel@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 29 Jan 2024 13:16:16 -0600
Message-ID: <CAPLW+4kSka+twSoZmQeMsh3RWermrGG-wyENrr14AmX3zZ2eqA@mail.gmail.com>
Subject: Re: [PATCH 5/5] clk: samsung: gs101: don't mark non-essential clocks
 as critical
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, alim.akhtar@samsung.com, 
	s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	mturquette@baylibre.com, sboyd@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 8:37=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> Hi Sam,
>
> On Fri, 2024-01-26 at 21:30 -0600, Sam Protsenko wrote:
> > On Fri, Jan 26, 2024 at 6:37=E2=80=AFPM Andr=C3=A9 Draszik <andre.drasz=
ik@linaro.org> wrote:
> >
> > >
> > > Note that this commit has the side-effect of causing earlycon to stop
> > > to work sometime into the boot for two reasons:
> > >     * peric0_top1_ipclk_0 requires its parent gout_cmu_peric0_ip to b=
e
> > >       running, but because earlycon doesn't deal with clocks that
> > >       parent will be disabled when none of the other drivers that
> > >       actually deal with clocks correctly require it to be running an=
d
> > >       the real serial driver (which does deal with clocks) hasn't tak=
en
> > >       over yet
> >
> > That's weird. Doesn't your bootloader setup serial clocks properly?
> > AFAIU, earlycon should rely on everything already configured in
> > bootloader.
>
> I tried to explain that above, but let me try again...
>
> The console UART, and I2C bus 8 are on the same cmu_peric0 controller, an=
d
> that cmu_peric0 has two clocks coming from cmu_top, ip and bus. For I2C8 =
& UART
> to work, both of these clocks from cmu_top need to to be on as they are t=
he
> parent of the i2c8-(ip|pclk) and uart-(ip|pclk) each.
>
> The bootloader leaves those clocks running, yes. So earlycon works (for a
> while).
>
> At some point into the boot, one of two things happens:
> 1) Linux will load the i2c driver. That driver does clock handling
> (correctly), it will initialise and then it has nothing to do, therefore =
it
> disables cmu_peric0's i2c8 ip and pclk clocks. Because at that stage noth=
ing
> appears to be using the cmu_peric0's ip clock (the real serial driver has=
n't
> initialised yet), Linux decides to also disable the parent ip clock comin=
g
> from cmu_top.
>
> At this stage, the earlycon driver stops working, as the parent ip clock =
of
> the uart ip clock is not running any more. No serial output can be observ=
ed
> from this stage onwards. I think what is probably happening is that the
> console uart FIFO doesn't get emptied anymore, and earlycon will simply w=
ait
> forever for space to become available in the FIFO (but I didn't debug thi=
s).
>
> Anyway, the boot doesn't progress, the system appears to hang. In any cas=
e it's
> not usable as we have no other means of using it at this stage (network /
> usb / display etc.).
>
> 2) Alternatively, the UART driver will load at this stage. Again, it will
> tweak the clocks and after probe it will leave its clocks disabled. The
> serial console driver hasn't taken over at this stage and earlycon is sti=
ll
> active. Again, the system will hang, because IP and PCLK have been disabl=
ed
> by the UART driver. Once the serial console is enabled, clocks are being
> enabled again, but because earlycon is still waiting for progress, the
> boot doesn't progress past disabling ip and pclk. It never gets to enabli=
ng
> the serial console (re-enabling the clocks).
>
> So in both cases we get some output from earlycon, but the system hangs o=
nce
> the first consumer driver of an IP attached to cmu_peric0 has completed
> probing.
>
>
>
> > >     * hand-over between earlycon and serial driver appears to be
> > >       fragile and clocks get enabled and disabled a few times, which
> > >       also causes register access to hang while earlycon is still
> > >       active
> > > Nonetheless we shouldn't keep these clocks running unconditionally ju=
st
> > > for earlycon. Clocks should be disabled where possible. If earlycon i=
s
> > > required in the future, e.g. for debug, this commit can simply be
> > > reverted (locally!).
> >
> > That sounds... not ideal. The ability to enable earlycon just by
> > adding some string to bootargs can be very useful for developers.
> > Maybe just make those clocks CLK_IGNORE_UNUSED, if that keeps earlycon
> > functional? With corresponding comments of course.
>
> CLK_IGNORE_UNUSED doesn't help in this case, the i2c and uart drivers wil=
l load
> and probe before earlycon gets disabled and as part of their probing disa=
ble
> the cmu_top ip clock going to cmu_peric0
>
> If earlycon is not enabled in kernel command line, everything works fine,=
 the
> kernel buffers its messages and once the real serial console driver start=
s,
> all messages since boot are being printed.
>
> Other than keeping it as CLK_IS_CRITICAL, there is no way that I can see =
to
> way to make the hand-over from earlycon to the real serial driver work in
> all cases.
>
> They are not critical clocks for the system, though, so it's wrong to alw=
ays
> keep them running unconditionally.
>
> We are past a stage where earlycon is generally required.
>
> If it's required for some local development, people can revert this patch=
 locally.
>

That sounds reasonable. But I wonder if that bit (about making this
clock CLK_IS_CRITICAL to make earlycon functional) can be documented
somewhere. Perhaps in the serial driver (earlycon function), or
somewhere in device tree bindings? Because otherwise it might remain
an arcane knowledge and people won't be able to use earlycon later.
Anyways, for this patch:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

and if you think it makes sense to document the bit above, please do.

>
> BTW, downstream doesn't suffer from this problem because downstream uses =
ACG
> throughout and clocks are enabled automatically in hardware as required.
>

Yes, using QCH clocks (HWACG) seems like a correct way to fix this,
and would be nice to have otherwise. Alas, it doesn't seems very easy
to implement, and should probably be based on top of regular clock
driver anyway. I thought about it for a while, but never came up with
particular ideas on how to implement HWACG support in Samsung CCF
framework properly.

>
> Cheers,
> Andre'
>

