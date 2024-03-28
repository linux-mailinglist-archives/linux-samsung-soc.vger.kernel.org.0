Return-Path: <linux-samsung-soc+bounces-2211-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C376D8738E8
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  6 Mar 2024 15:24:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 626201F257D5
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  6 Mar 2024 14:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841CA132C1B;
	Wed,  6 Mar 2024 14:24:02 +0000 (UTC)
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from 7.mo575.mail-out.ovh.net (7.mo575.mail-out.ovh.net [46.105.63.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BD5133425
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Mar 2024 14:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.63.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709735042; cv=none; b=OsZnE+MytXwCAOlSXU6DLukWuHUXT7sd5Ycc7L9MCbDfi3629AoL6Flk7SpuX8FMss75UC2hKvZM/LFRExLULn9C89IT24FG1MTRijmFAGFh0+TUJ1DIxW/DVEJxihcaNO0eSA9Ft6KaIIxv4r9tSYcfSGKxa8z+tzmjA+V2IVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709735042; c=relaxed/simple;
	bh=r5/BbODiVYHKi4Vy9BlmKr5xBKMSKvqljtQVJe3nSwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sds5oPjRFaaeYJ+TYP4XX/MVRn7DqYMSDYjmb0fJ8YFbpRnQ/DGgMVCE38sy44UDEz6PtxX3t/KQpmlG6M8GeUsZVch1a1T5q34HUGj7pGB2Wz+LUhLZKTOLMgrRXk9liQyVdraFSIcbDZZ1N5L+7250dH0CwpK+40NLdS5svvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.63.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.176.170])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4TqW8n15J8z1Hqj
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Mar 2024 11:55:37 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-n2q92 (unknown [10.110.113.124])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B275B1FE65;
	Wed,  6 Mar 2024 11:55:33 +0000 (UTC)
Received: from etezian.org ([37.59.142.107])
	by ghost-submission-6684bf9d7b-n2q92 with ESMTPSA
	id xHmDHbVZ6GUUgAEA0v5T7Q
	(envelope-from <andi@etezian.org>); Wed, 06 Mar 2024 11:55:33 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-107S0019a2d669e-ee64-4ca9-a271-21f25ef40524,
                    62DEF991EB217AB86F953B10C2782167B22AFEEB) smtp.auth=andi@etezian.org
X-OVh-ClientIp:89.217.109.169
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Naveen Krishna Ch <ch.naveen@samsung.com>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@axis.com
In-Reply-To: <20240305-i2c_exynos5-v3-1-17a749688806@axis.com>
References: <20240305-i2c_exynos5-v3-1-17a749688806@axis.com>
Subject: Re: [PATCH v3] i2c: exynos5: Init data before registering
 interrupt handler
Message-Id: <170972613133.1712532.6066452137196640811.b4-ty@kernel.org>
Date: Wed, 06 Mar 2024 12:55:31 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Ovh-Tracer-Id: 6464917266006870544
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledriedugdefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepffetheduffdvhfdugfffudfgjeejudehheegfeeguefhieeugffhgfeuffdvgfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpkeelrddvudejrddutdelrdduieelpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhsrghmshhunhhgqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehjeehpdhmohguvgepshhmthhpohhuth

Hi

On Tue, 05 Mar 2024 11:50:00 +0100, Jesper Nilsson wrote:
> devm_request_irq() is called before we initialize the "variant"
> member variable from of_device_get_match_data(), so if an interrupt
> is triggered inbetween, we can end up following a NULL pointer
> in the interrupt handler.
> 
> This problem was exposed when the I2C controller in question was
> (mis)configured to be used in both secure world and Linux.
> 
> [...]

Applied to i2c/i2c-host-fixes on

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Thank you,
Andi

Patches applied
===============
[1/1] i2c: exynos5: Init data before registering interrupt handler
      commit: 51130d52b84c473f5da5378aa7e7633611f79313


