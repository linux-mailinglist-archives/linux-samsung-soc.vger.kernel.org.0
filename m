Return-Path: <linux-samsung-soc+bounces-4032-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B39946E56
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  4 Aug 2024 12:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CB0628184F
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  4 Aug 2024 10:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC482D05E;
	Sun,  4 Aug 2024 10:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="cbzRaOqp"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D032025740
	for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Aug 2024 10:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722769188; cv=none; b=ERktYQiOU/0ggHsRBlFw2VpX588FsrDYWYqfjsgnGUiWUTGRnIgyrOHQ2Wk72lpprgc+slfj/jcZzg061aSKNT6pR1CwtO6tuq4WHrMuxzm/CzSrDcEFu3OblxoWIwcPnYjR8pXYGppB+Lpy2VoaLiNkYiw+FzIAxo8KoH0VGpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722769188; c=relaxed/simple;
	bh=L5Vrw3PKvawaKJnULY9jEBAZo/94igeafx99+6TgBFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KR/7V5lBj4cS8ibS0T2aKUX9gM5x9Oz3bv1YMd4+7BCUx4jvku3LZZY4a3GrSnj17q+D8Fk1tZpojLsvEs9fgDp1lQkPgmUNXD32qsbXc0i9ECTI2WbZWp9IuVnVMBkqJtCStD8sYb0luPFKe0hXkJR9XT3xcMwYep4y1EUBPOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=cbzRaOqp; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Date: Sun, 4 Aug 2024 12:59:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1722769181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D73264s0rVgukFWFnLR+vhWZQ06smgTwC5awVs888Oo=;
	b=cbzRaOqpNdt0nkCPe1REyNFoxFAt3LxF1sfg91oYwLswUpazCyM3ajF/GDqm52fr6A49ut
	S2Z0/jlSgpicapb27uC9ISakign8gj+erkvowgPE/jVRKjQsRIEmVHz8vk1amegcFFTZv4
	gBZpGNFFqaJgL28qqk5Tm1WWbX6b0xw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Wolfgang Wiedmeyer <wolfgit@wiedmeyer.de>,
	Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 00/10] power: supply: max77693: Toggle charging/OTG
 based on extcon status
Message-ID: <20240804105937.GA20421@l14.localdomain>
References: <20240729-max77693-charger-extcon-v3-0-02315a6869d4@gmail.com>
 <20240801062253.GA2681@l14.localdomain>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801062253.GA2681@l14.localdomain>
X-Migadu-Flow: FLOW_OUT

Hi again Artur,

On Thu, Aug 01, 2024 at 08:23:26AM +0200, Henrik Grimler wrote:
> Hi Artur,
> 
> On Mon, Jul 29, 2024 at 07:47:34PM +0200, Artur Weber wrote:
> > This patchset does the following:
> > 
> > - Add CURRENT_MAX and INPUT_CURRENT_MAX power supply properties to
> >   expose the "fast charge current" (maximum current from charger to
> >   battery) and "CHGIN input current limit" (maximum current from
> >   external supply to charger).
> > 
> > - Add functions for toggling charging and OTG modes.
> > 
> > - Add an extcon-based handler that enables charging or OTG depending
> >   on the cable type plugged in. The extcon device to use for cable
> >   detection can be specified in the device tree, and is entirely
> >   optional.
> > 
> > The extcon listener implementation is inspired by the rt5033 charger
> > driver (commit 8242336dc8a8 ("power: supply: rt5033_charger: Add cable
> > detection and USB OTG supply")).
> 
> Tested on exynos4412-i9305 (after applying the changes in patch 8 - 10
> to exynos4412-midas.dtsi).  It works well, device correctly identifies
> a usb cable connected to charger or a usb cable connected to computer,
> and sets a limit of 1.8 A and 0.5 A in the two cases.
> 
> I did notice that device does not always detect cable insertion, so I
> can occassionally get two de-attach events in a row.  Cable was
> inserted between 428 and 462 in below log snippet:
> 
> [  389.458399] max77693-muic max77693-muic: external connector is attached(chg_type:0x3, prev_chg_type:0x3)
> [  389.469765] max77693-charger max77693-charger: fast charging. connector type: 6
> [  428.151857] max77693-muic max77693-muic: external connector is detached(chg_type:0x3, prev_chg_type:0x0)
> [  428.160319] max77693-charger max77693-charger: not charging. connector type: 13
> [  462.156048] max77693-muic max77693-muic: external connector is detached(chg_type:0x0, prev_chg_type:0x0)
> [  469.881925] max77693-muic max77693-muic: external connector is attached(chg_type:0x3, prev_chg_type:0x3)
> [  469.890049] max77693-charger max77693-charger: fast charging. connector type: 6
> 
> but this is probably an issue in extcon driver though rather than
> charger.
> 
> I have not tested so that MHL still works, as I do not have access to
> that cable at the moment, will try it in a few days.

MHL now tested on exynos4412-i9300 as well.  It works, and the series
fixes so that we can hotplug the cable (with a few patches to make
sii9324 use extcon as well), before we had to connect cable before
boot and rely on bootloader to setup everything.  Thanks!

> > Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Tested-by: Henrik Grimler <henrik@grimler.se>

Best regards,
Henrik Grimler

> > v3 no longer uses the CHARGER regulator to manage the power status, and
> > that's for two reasons:
> > 
> > - Regulator enable/disable behavior was interfering with how the power
> >   supply driver worked (we occasionally got "unbalanced disables"
> >   errors when switching charging state, despite checking for the
> >   regulator status with regulator_is_enabled() - the CHARGER reg would
> >   report as enabled despite the enable count being 0).
> >   This broke OTG insertion if the OTG cable was plugged in first, and
> >   sometimes caused warnings on unsuspend.
> > 
> > - Changing the charging values directly in the power supply driver is
> >   less opaque and lets us avoid bringing in a dependency on regulators.
> > 
> > It also splits the current limits back into two properties:
> > INPUT_CURRENT_LIMIT and CONSTANT_CHARGE_CURRENT_MAX. Again, there are
> > two reasons for this split:
> > 
> > - They are two separate current controls, one for USB->charger and one
> >   for charger->battery, and they have different limits (0-2.1A for CC
> >   vs 60mA-2.58A for input). Given that the power supply core has the
> >   properties for both values separately, it's more logical to present
> >   them as such.
> > 
> > - It's safer to keep these separate; CONSTANT_CHARGE_CURRENT_MAX is
> >   pretty explicitly only set *once* - at probe time with a safe value
> >   specified in the DT. This way, INPUT_CURRENT_LIMIT is safer to modify
> >   since in the event of an invalid value the CC current will hold back
> >   the extra current thus preventing damage to the battery.
> > 
> > The latter is relevant as I'm working on a follow-up patchset that
> > allows for controlling the charging parameters using power supply
> > properties/sysfs properties rather than the CHARGER regulator.
> > 
> > Note that the CHARGER regulator gets disabled automatically if it's
> > not used, which will disable charging if it was auto-enabled by the
> > extcon code. This can be worked around by re-attaching the cable, or
> > more properly by removing the CHARGER regulator from DT for devices
> > that use the extcon-based charger management, as has been done in the
> > Galaxy Tab 3 8.0 DTSI.
> > 
> > See v1 for old description:
> > 
> > https://lore.kernel.org/r/20240530-max77693-charger-extcon-v1-0-dc2a9e5bdf30@gmail.com
> > ---
> > Changes in v3:
> > - Drop uses of CHARGER regulator, manage registers directly in power
> >   supply driver instead
> > - Link to v2: https://lore.kernel.org/r/20240715-max77693-charger-extcon-v2-0-0838ffbb18c3@gmail.com
> > 
> > Changes in v2:
> > - Changed to use monitored-battery for charge current value
> > - Both current limit variables are now set by the CHARGER regulator
> > - Link to v1: https://lore.kernel.org/r/20240530-max77693-charger-extcon-v1-0-dc2a9e5bdf30@gmail.com
> > 
> > ---
> > Artur Weber (10):
> >       dt-bindings: power: supply: max77693: Add monitored-battery property
> >       dt-bindings: power: supply: max77693: Add maxim,usb-connector property
> >       power: supply: max77693: Expose input current limit and CC current properties
> >       power: supply: max77693: Set charge current limits during init
> >       power: supply: max77693: Add USB extcon detection for enabling charging
> >       power: supply: max77693: Add support for detecting and enabling OTG
> >       power: supply: max77693: Set up charge/input current according to cable type
> >       ARM: dts: samsung: exynos4212-tab3: Add battery node with charge current value
> >       ARM: dts: samsung: exynos4212-tab3: Add USB connector node
> >       ARM: dts: exynos4212-tab3: Drop CHARGER regulator
> > 
> >  .../bindings/power/supply/maxim,max77693.yaml      |  15 +
> >  arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi     |  22 +-
> >  drivers/power/supply/Kconfig                       |   1 +
> >  drivers/power/supply/max77693_charger.c            | 302 ++++++++++++++++++++-
> >  include/linux/mfd/max77693-private.h               |  12 +
> >  5 files changed, 337 insertions(+), 15 deletions(-)
> > ---
> > base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
> > change-id: 20240525-max77693-charger-extcon-9ebb7bad83ce
> > 
> > Best regards,
> > -- 
> > Artur Weber <aweber.kernel@gmail.com>
> > 

