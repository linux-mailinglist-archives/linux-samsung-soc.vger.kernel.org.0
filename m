Return-Path: <linux-samsung-soc+bounces-11483-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E18BCBB87
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 10 Oct 2025 07:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EC683B5363
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 10 Oct 2025 05:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6729A263C8C;
	Fri, 10 Oct 2025 05:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p2bwy6/W"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE41C2EA
	for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Oct 2025 05:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760074146; cv=none; b=tMFbo6udXCAgyW0CczwYL3Bz1iisqyDRNuIlwW/tsa5rs42LjEcaLRX1vyD2iLiXVQraqyjbh6mmLDUn2oxCDRpXXFXF6yndiL3J9XZ74oZgbR+FDrT+AOwXhq2wbYYc4MIxfnU8kOaCLVixgWiRbf1jQwvz+8yneUURGLsWLCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760074146; c=relaxed/simple;
	bh=8aR+InBDnBjn09cnwllCT+9UwMA0LVX9Wn4YRKaxBLY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t25raRtIc+X+By7yMbFysgLGeoNP/ALYv7YMHCKHA+gZQzLurWBEFiwyWwWs8PubwUYu3dD9jVxyrWQcMnmC8rEefkeZIamFwbIUG3ruLemxPRTO6pir0/TfoE+Bf/UFpZs8nTIMZUDr5+6cYR/7zIGStGLHV41lKxNkiNT/OhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p2bwy6/W; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-639e1e8c8c8so3318032a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Oct 2025 22:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760074143; x=1760678943; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8aR+InBDnBjn09cnwllCT+9UwMA0LVX9Wn4YRKaxBLY=;
        b=p2bwy6/WUIHRboQGuzwx3CKzj5GpwrXYeEMxPfjp25vfUnXlElyNPsyvuVjOSuYQQd
         ijT8HZnozmJdj5czSOQKRcL4Oqd8ILE4fZSwwMTYkXiPudrr85EJNXm8dwm31OScRQ/A
         r/9nRC0U1VVwomgPxC3NnHvj1gRqzJ2d7hAC9qtlTPha6IHT1O3Zcp/3jgAWd2ULJK+O
         zOB2h3Q5FW/ERZKgd1k5ok93ziMyMrPgMYsjn+kRko9XUMOZuLXpeUpkqTh9qdvV6eFw
         emv50INM8hLOjWcHTpbfr0JBkTu2w5IcKvqehYIRMHdEnZtMm4qHJ11kjOIWwFTa62F+
         /Org==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760074143; x=1760678943;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8aR+InBDnBjn09cnwllCT+9UwMA0LVX9Wn4YRKaxBLY=;
        b=LphR/jm1hRw+70m0AE3l9BfoudoZiG39ldF4S4P64QPlTauRTkvDtnplh3WGskpBZS
         m9/3tD2zdla61g8bSeMIkOm0qRZFfLq+1TCLaJE7CUeDun1rZdFPaQwvAmfEWuGjbdah
         UTcZ++Ii3A45RE5QFxYUJJsF+XS7196n1wC0Si8tA3BZghmgOl+IYEv4+iSFiHlwS29l
         A1zOoeS2vfNHsp8U0pam9tcfM8G7DSOGVhG0CNJ0RvLopAw9f1/PrPtxBq3l2QJzDH3B
         h2X7OTS+kjjzc5yy8LnNo2im+Gap1QOVMhuyrSUMghv0Fu0pmjaamKvPxduhSNMQXt2K
         ny8w==
X-Forwarded-Encrypted: i=1; AJvYcCWSiigvhKdq3Jx23AcSyMuKyOgDc5rcU5zNH/hnKm4f967UfpiaoSYAIJSYFUp5z0mvaPLwc59CrJ74GDRqIUttiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY0W9hExCpt+9mVUoDDm3HOxLZaeohAQxnB3ov+iAYD89UfvKj
	A+Qc9dGWeJye8vA9XWhkQOHC9GWgbZcBS/G1mogqwYb9WNLfIc5ZWNNYl3pDm7BoumU=
X-Gm-Gg: ASbGncu0tVh+m49Q0Z0t5K6qjWwV879c6eJtL0wFhBhfUrK6QV9hruA3kDZExEWNk1l
	ZNka6O+6dw3JBH0JLE1s7idqjcMOMXfyWeuf/DFJQCK2vLt6wrHsKej7hRkTEdo1YwAOnDEjToQ
	p9aSKXzMOupOFM5zaf9W7elru8hOeTTuYVhoaOuUM5nf0ZofSQE6BSn3zTlO42l+inoulTAoMoj
	+mMUAbwdNRjL49en9if3m+tWl9lJD+EJpc0QUy4jvJKKe+6Y/gJNkuxx2/y81+jE7NaNFeFhiQ8
	h0OmLIz+Ztt9p7g5Ff/CRMI+J1rv7mSW6hMUI2s2ABRZh4bOt9IL7dMuWGkKmPi7sR+FsaZlJC9
	BRkSC68L2QBztPuV1PlClmd0Hfc43lBgDnnCpb0fIoUphOjA/
X-Google-Smtp-Source: AGHT+IG0R4w9Z3PlluIRXd9lN4bhh6YAYGuTKxcKQNJqwpna264jwoUI8J+xZkraphoRjdWXanfcWg==
X-Received: by 2002:aa7:c594:0:b0:634:5297:e3b3 with SMTP id 4fb4d7f45d1cf-639d5c79798mr6900276a12.38.1760074142813;
        Thu, 09 Oct 2025 22:29:02 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a461703dbsm1459171a12.0.2025.10.09.22.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 22:29:02 -0700 (PDT)
Message-ID: <a00c61f8c705ace0838ac021489d5300ea95dc21.camel@linaro.org>
Subject: Re: [PATCH 03/10] pmdomain: samsung: use to devm_kstrdup_const() to
 simplify error handling
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Ulf
 Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Date: Fri, 10 Oct 2025 06:29:01 +0100
In-Reply-To: <ee66dca6-3cd6-41d3-82f9-d2673da00287@kernel.org>
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
	 <20251006-gs101-pd-v1-3-f0cb0c01ea7b@linaro.org>
	 <5df18f42-b567-4d27-9e12-29723af40d6e@kernel.org>
	 <9d4ccadf76ccfff1a8b5f572b8aa190e2dc40c29.camel@linaro.org>
	 <63fb3ccc10267add00b579d4a05497cbeeadc65e.camel@linaro.org>
	 <ee66dca6-3cd6-41d3-82f9-d2673da00287@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-10-10 at 02:35 +0200, Krzysztof Kozlowski wrote:
> On 09/10/2025 23:00, Andr=C3=A9 Draszik wrote:
> > On Thu, 2025-10-09 at 14:31 +0100, Andr=C3=A9 Draszik wrote:
> > > On Thu, 2025-10-09 at 09:13 +0900, Krzysztof Kozlowski wrote:
> > > > On 07/10/2025 01:43, Andr=C3=A9 Draszik wrote:
> > > > > Convert to using devm_kstrdup_const() so as to simplify cleanup d=
uring
> > > > > error handling.
> > > >=20
> > > >=20
> > > > This is either a fix (then describe the fixed issue and add Fixed t=
ag)
> > > > or you change the logic, not only simplify.
> > > >=20
> > > > Previously on of_genpd_add_provider_simple() the memory was not
> > > > kfree_const. Now it will be.
> > >=20
> > > Indeed it's a fix after all - While the driver doesn't allow unbind,
> >=20
> > Thinking more about it - at this stage, this patch is not a fix. The dr=
iver
> > can not unbind, hence there is no leak to be plugged, hence no fix.
>=20
> It is about error paths. Driver can fail binding.

Thank you Krzysztof for your patience. Yes, I had overlooked that
of_genpd_add_provider_simple() itself can fail. Sorry for
the noise.

Cheers,
Andre'

