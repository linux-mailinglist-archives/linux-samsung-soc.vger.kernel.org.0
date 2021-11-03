Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 138B2444292
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  3 Nov 2021 14:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231755AbhKCNlP (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 3 Nov 2021 09:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbhKCNlP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 3 Nov 2021 09:41:15 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2790BC061714
        for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Nov 2021 06:38:39 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id q33-20020a056830442100b0055abeab1e9aso3506025otv.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Nov 2021 06:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=PINhxUnEav9T+sIWQMASBdo/YvHSfvwYi600ZEdY2Fc=;
        b=IyoZKYHL+NCOQsIFBcjjG6uMARZOcrMWbEKnK77KKVTxWeB0K0Ua0D6wXQpoL0eHrr
         QB/bCE0zmdgeAIDRkBUz9xrde8oM4wobkT7Ja8XGQjbdSE0Ugy14+ZqVxWYGoRVDVqel
         9Uv7SuxIg8G+su3HhJmE5jtcgN2gZ1Qg6qGFSl++ieiIvEvmHhX40kuB3dhVH14PlpIu
         b3Wb+zfw1ChJGXAuujqYjLS7kufUtx5reI+ddcz6eN+o68TCltvt2DcVstEWLSev0kfY
         9NKwSh9eWpjVSyICdejmbVnOB9vo9O51koQz9jxZ9cBMiNZ7BC1+tRzaClqgKYjN3Xax
         3hPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=PINhxUnEav9T+sIWQMASBdo/YvHSfvwYi600ZEdY2Fc=;
        b=AnKLFSzBwGt7AorXS6RvUE9PNmWbYjObbB6lcx0jIA8hcYcsQxg3dDEC+r9YGrp9cr
         7PV5w9drWVLJ8iSfyueSQIfLau6v1jH039JDexE9q8G4/+tJzefPHlF/uqP6/E8Imv+E
         vXAj2GvFMfCIhYQr/11Yd3BELnl+Xw7ZNJ61aKiKQyLTBgXW7CHKv1LEQ4BApgIc5GuQ
         wP/UDzVsZxZHXIFSsEjt5dszp6IBrUyOkipsYPDM10FUetY9qTgZDlX/bd9XQdJrVhSl
         B/HI3Ri8UQ0qe8ZzT0boYYSPyQB2rkDWzt4bTSjj72lGDHqFZP7Ry1ouYkdGgr11CCb6
         IvBg==
X-Gm-Message-State: AOAM533rmpy0r5dlMctmFhMggN4K9GUcbFaQDO9+1iI+GI/KDDKACkK1
        nwV1gESsFvC2dK0PpjWcrhK2DM7FHFKSmE61PZXm4tCBSP8=
X-Google-Smtp-Source: ABdhPJw87wqnqZJOo63G/YnKclyClPH4K5UC5ZuEj9UT5X5qKo/qgn9qHbssVw5ZQPO/QDHuLo4PfUaXW9UQ5X3CLLA=
X-Received: by 2002:a9d:7e82:: with SMTP id m2mr12469940otp.340.1635946371041;
 Wed, 03 Nov 2021 06:32:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6838:2806:0:0:0:0 with HTTP; Wed, 3 Nov 2021 06:32:50
 -0700 (PDT)
Reply-To: dh2053678@gmail.com
From:   dennis henson <revpastordesmondfolly@gmail.com>
Date:   Wed, 3 Nov 2021 14:32:50 +0100
Message-ID: <CAPVKVfGVeSgTThfqfj5p_BF-C=82OPh+jpq53m90B9n6X3Ts=A@mail.gmail.com>
Subject: Ask for your kind assistance
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

I have emailed you without response.In my first email I mentioned
about my late client from your country whose relatives I cannot get in
touch with both of you have same last name so it will be very easy to
make you become his official next of kin.I am compelled to do this
because I would not want the bank to push my client=E2=80=99s funds (=E2=82=
=AC8.5
Million Euros) into the bank treasury as unclaimed inheritance,it's
legal and 100% risk-free.
Kind regards,
Dennis.
