Return-Path: <linux-samsung-soc+bounces-3711-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AD1929FF9
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  8 Jul 2024 12:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5DCB287E3B
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  8 Jul 2024 10:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785CC768E1;
	Mon,  8 Jul 2024 10:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tSeDj6eI"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AEC22F1C
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 10:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720433684; cv=none; b=k1NPJoR2QCTWl7lpzMa7zId35RovV+UzrxcWfMGMwkN8MstKbI1RJPebMpguJ2KgY8ymhlj1+jpCn+VaSELqiJeEG5ORG09f+Rg4hxdyTiI7BLjyVl89gRcFbLLZhta78nz7Z11XbNXCUTOfMyuKQbdikLeCZ4Gax1wSQq8wCvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720433684; c=relaxed/simple;
	bh=mdVR5DRCAlUSw+xlybDf+S/9XIvFQblFmhn0Muinhjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEacvFtIHDjffQU+8LCHtaywaFQAow+tMqZ86Bw70IJjFtQfciK3N0Ye46yIQFWBI9Xa0CAreYoBOHgsJgLdgfAexuiEydIa0qAA71x0BaaoDnwNWQSU0zBHIXLGkUfXCZPVbd6buAxldn5cjyfQ72/Xwtz0bMUTs7YAfY9mkSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tSeDj6eI; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5c661bcb9a0so719605eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jul 2024 03:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720433682; x=1721038482; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=18mFUjlhCEFSztkcHmlQ6M7fE1sy3dAJtP6H2AmzxHQ=;
        b=tSeDj6eIjkW+IJkgWUeAl0cZurxmv0Pw1t0bB5Bkf8+4CI2U61LynOPqZAo8J5PoMl
         ZBstK80tW+zwtb6mDrfHagNiMQUgaGzntUsOaK9ah7WEK9p7Q726lq9QTP692MoSBleX
         t+Og1wOCBwK+K25UQ99uDB3XKjwxGPAffccBTN8bXEzJw88+IYy0/M5apbRgd4pvuo4t
         KX7wTMV8iY9y1Sv/9F17uP5c0OWoaDEd9tcHSioxH5TMEO4HYmRcswylEwTgmgeezugA
         hV/55ve5pTa5A266bwE+7errpEnGisTXcWuGhuNAXKj7/HLojPGV1V5g8AMNBf5R+2hL
         dmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720433682; x=1721038482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18mFUjlhCEFSztkcHmlQ6M7fE1sy3dAJtP6H2AmzxHQ=;
        b=ZWdCa+8r7rKrBsuLkVvwgAGYIrg6VFqoaMDCCNR6vvY6qGM8WnCnMI2oHwVpT1y6IQ
         7LamfVqSzZMhN4VBZEYLCCAMJ0DB6YVIIPTsbo4Jg8VIhxF1uk9OPRu2asQtDX1dG7jL
         3YTnbeP2t6UMsIc3uMoozsXgATOd/UNFkxfLAvm8ZJjJSWpXjuDuetabtkmOSpeprTWY
         XQX5pTBR1p/rEifFqLVbBd2F61BoS4IqTQH1x6SlI8ha5we8hDAxlcxUfnqiN3yXtUkq
         NS5YMXKW9Z2XC2iZGxzFsO7MIBfcjU8SaEwpMbNqWHcPlmh1X66wMam5nDcFGvsmm2my
         r/RA==
X-Forwarded-Encrypted: i=1; AJvYcCUzSaoTj3nFrAt/kBchfvk+DGs3aPS2FjsgDiKLsbrS9TuoWxZ+IyIMzxEFJlb8pcNmyHS2h4v7QmWr8kHapuMr+68amFyqIF95ZDvPrv9WrYE=
X-Gm-Message-State: AOJu0Yxxy1kHlaYxJxbbVQPnDgpus4Jb17jSe1m6pHCw8JK+n/BQT9uW
	y8F3Tal/qisQXms1sNDjWuAwNIQlXahcIhQHpjHFH1EUWoh/hxCWSEXNmb9YVGCDd3WdTua3HBJ
	ZSSQ8+IXBN9+1tV4uX9ed8tRPSQMyQtdoLe+S2A==
X-Google-Smtp-Source: AGHT+IEidV5BA3GbP/YUGyFWXUPUfjUVbg/HkGroMH2IukzlChvyhkwiqBj3UjHON66KEYrUdeF5hH0WDWHlcPueGqc=
X-Received: by 2002:a4a:2:0:b0:5bb:1310:5f37 with SMTP id 006d021491bc7-5c646e9798cmr9054879eaf.3.1720433682004;
 Mon, 08 Jul 2024 03:14:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702072510.248272-1-ebiggers@kernel.org> <20240702072510.248272-3-ebiggers@kernel.org>
In-Reply-To: <20240702072510.248272-3-ebiggers@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 8 Jul 2024 11:14:31 +0100
Message-ID: <CADrjBPop5VwR+QW8XQi7ALEwWpt=OkB1X7bPjfk9gaWHn95r9g@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] scsi: ufs: core: fold ufshcd_clear_keyslot() into
 its caller
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-fscrypt@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	William McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Eric,

On Tue, 2 Jul 2024 at 08:28, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Fold ufshcd_clear_keyslot() into its only remaining caller.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>

[..]

regards,

Peter

