Return-Path: <linux-samsung-soc+bounces-7263-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A4EA4EAFB
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  4 Mar 2025 19:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D90788356B
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  4 Mar 2025 17:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656CD290093;
	Tue,  4 Mar 2025 17:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXBGCcFN"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from beeline1.cc.itu.edu.tr (beeline1.cc.itu.edu.tr [160.75.25.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9292264F8C
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 17:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=160.75.25.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741109609; cv=pass; b=ZsqCNvwfgYMgzJfXrQLlDGRiwa9a7StoYEh3/hpwCrP/7XTqA4FRLJb9gaZAQDZ1W38P+PWIuPrGlOqusOIFNzCkicYHaTgouUC8TtHURnvNwa9XZU9dYOWlh4xNdqEe3PD0Ej0WJS6JqkDkCBE7M78iWXQal2mspoNUjEx9GZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741109609; c=relaxed/simple;
	bh=rQhuOhPQN+FZjrqXHcNYZMzBbVyBkKtzpG5IcXStqR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5Fxh5qlhcXiI08iV5lMczHpyXvPsFAWmH8mfMlQ/xXDfWck2t2mdHFsjvDl8CAfMUzxlUrOh+Q+SWzFHP69VoIVMnoHb0VPcKg1jdNQCJAF1j0RNOE4Ma/F8OJaSQvJjSTF8n67m8ExLRgX9SAJ84AktCLCRlU7d8vN/1cHjsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXBGCcFN; arc=none smtp.client-ip=10.30.226.201; arc=pass smtp.client-ip=160.75.25.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cc.itu.edu.tr
Received: from lesvatest1.cc.itu.edu.tr (lesvatest1.cc.itu.edu.tr [10.146.128.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by beeline1.cc.itu.edu.tr (Postfix) with ESMTPS id DEFD640D4DE5
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 20:33:25 +0300 (+03)
X-Envelope-From: <root@cc.itu.edu.tr>
Received: from lesva1.cc.itu.edu.tr (unknown [160.75.70.79])
	by lesvatest1.cc.itu.edu.tr (Postfix) with ESMTP id 4Z6fCJ5s72zFyQf
	for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Mar 2025 18:06:20 +0300 (+03)
Received: by le1 (Postfix, from userid 0)
	id 288F34273B; Tue,  4 Mar 2025 18:06:13 +0300 (+03)
Authentication-Results: lesva1.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXBGCcFN
X-Envelope-From: <linux-kernel+bounces-541243-bozkiru=itu.edu.tr@vger.kernel.org>
Authentication-Results: lesva2.cc.itu.edu.tr;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXBGCcFN
Received: from fgw2.itu.edu.tr (fgw2.itu.edu.tr [160.75.25.104])
	by le2 (Postfix) with ESMTP id 518FE41F87
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:11:34 +0300 (+03)
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by fgw2.itu.edu.tr (Postfix) with SMTP id 049D52DCDE
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 12:11:33 +0300 (+03)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59C2B16C68B
	for <bozkiru@itu.edu.tr>; Mon,  3 Mar 2025 09:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820D31F0E2A;
	Mon,  3 Mar 2025 09:10:54 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD00218C937;
	Mon,  3 Mar 2025 09:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740993051; cv=none; b=UXj9mT39bVhKod0fUp9AbkKxxJBiWCRWwRWWPWOY4UVwy3K1unvX4NfJ2/lepz3R7gq4MnYkDWwvhGsjs0HWmu2+UilyfxAuSoCm2qbi/Uhpw/h5dEhXjVqlWADSM0z2iax1ZRlQpsQPrpeVdA9NfBNr5tHWeZcwmf0C9qngNBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740993051; c=relaxed/simple;
	bh=rQhuOhPQN+FZjrqXHcNYZMzBbVyBkKtzpG5IcXStqR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQd73sBUIpCRAWCnO0Qy5Ez+DMHwcXxSSjD66/sfyfhK78pPhPB5NhUd23+BjTo5vWbqunjrgsld+sDRQkZom7SoeX4O90s0xhAt/i/Irs+2Fs259wMA3f6c3OO9uRKdQpJQ4wJzalI12D/r6IcLBwj8CS3X+aurFrdCkKNr8Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXBGCcFN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3101C4CED6;
	Mon,  3 Mar 2025 09:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740993051;
	bh=rQhuOhPQN+FZjrqXHcNYZMzBbVyBkKtzpG5IcXStqR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RXBGCcFNN5gm4B/UBhQRJynuGQLRDdWPsWpYTdmJRsPjjfKdWZXQ5jrPIXqmgUWfq
	 NlzKeDul7PAk0gqc8gTqP2YkQxyxcySHjm9xLWZEePPU8bTEavVcPqszz/jLR3Vcmv
	 ijZ3m/3oeaBr5CnLzNMFS5oqmcYqDIuMF7+jmIQWwDTkYRvI8JWcKS3nl+swa11l44
	 9b6SzMqwkbJPiLWFqsjiNFiaB3VtKagM73SChIc8M9rDwXgoqZt712F057rGARYzKj
	 O+6gahZBSWAj2zscHAj9zSbUeiRjSHL1AL+HBSI4/WvIB9OjXLabSrCu7f04v1n07S
	 xbDHKLWhRXJiw==
Date: Mon, 3 Mar 2025 10:10:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/3] mfd: sec: add support for S2MPU05 PMIC
Message-ID: <20250303-screeching-quartz-puma-9ea09a@krzk-bin>
References: <20250301-exynos7870-pmic-regulators-v3-0-808d0b47a564@disroot.org>
 <20250301-exynos7870-pmic-regulators-v3-2-808d0b47a564@disroot.org>
Precedence: bulk
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250301-exynos7870-pmic-regulators-v3-2-808d0b47a564@disroot.org>
X-ITU-Libra-ESVA-Information: Please contact Istanbul Teknik Universitesi for more information
X-ITU-Libra-ESVA-ID: 4Z6fCJ5s72zFyQf
X-ITU-Libra-ESVA: No virus found
X-ITU-Libra-ESVA-From: root@cc.itu.edu.tr
X-ITU-Libra-ESVA-Watermark: 1741714294.8676@K1ZSKnOrm9mQc2xfND73qQ
X-ITU-MailScanner-SpamCheck: not spam

On Sat, Mar 01, 2025 at 01:07:13AM +0530, Kaustabh Chakraborty wrote:
> Add support for Samsung's S2MPU05 PMIC. It's the primary PMIC used by
> Exynos7870 devices. It houses regulators (21 LDOs and 5 BUCKs) and a RTC
> clock device.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/mfd/sec-core.c              |  12 +++
>  drivers/mfd/sec-irq.c               |  34 +++++++
>  include/linux/mfd/samsung/core.h    |   1 +
>  include/linux/mfd/samsung/irq.h     |  44 +++++++++
>  include/linux/mfd/samsung/s2mpu05.h | 183 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 274 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



