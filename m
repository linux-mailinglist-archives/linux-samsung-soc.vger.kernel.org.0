Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6F734F06F4
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  3 Apr 2022 05:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233703AbiDCDIU (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 2 Apr 2022 23:08:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231690AbiDCDIT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 23:08:19 -0400
X-Greylist: delayed 345 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 02 Apr 2022 20:06:09 PDT
Received: from mta-out-03.alice.it (mta-out-03.alice.it [217.169.118.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A7C5038BF4
        for <linux-samsung-soc@vger.kernel.org>; Sat,  2 Apr 2022 20:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alice.it; s=20211207; t=1648955169; 
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        h=Reply-To:From:To:Date:Message-ID:MIME-Version;
        b=MwWddbL45eDcCECGk+KWXHCMNWiXNlJO9CUsysT0gdi+VSwNtFgp5ENhm3/awsEGZ/53Wor20XgxQCKMl3pOhtr8wEBhJeIxsc7U2uK6jBur+kA3KXiuRKgFpInBkWBUexI3dohfwnVXPuq2XKJwNtLUZLg4ZCu41c+fxge03tTOglUdmrQUZRyVw6a6rx2xWZhMAJCf+kmZ/0KwSvJ4t/KCXP+oHOGH5mvnzMtAtRBiDTXtqMX75NX1zSnQPI+jjaMB5mjJFhrEWEqcdmpIvoHGvIGhM17EETKu0XLpxFgxmoUmLLMJLDsM1YlKMluGTjZvcwKvKpjoD14DEUpw9Q==
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiledgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvffgnffgvefqoffkvfetnffktedpqfgfvfenuceurghilhhouhhtmecufedtudenucfgmhhpthihuchsuhgsjhgvtghtucdluddtmdengfhmphhthicusghougihucdlhedtmdenucfjughrpehrhffvfffkggestddtfedttddttdenucfhrhhomhephggvuchhrghvvgcurghnuchofhhfvghruchtohcuihhnvhgvshhtuchinhcuhihouhhrucgtohhunhhtrhihuchunhguvghrucgruchjohhinhhtuchvvghnthhurhgvuchprghrthhnvghrshhhihhpuchplhgvrghsvgcurhgvphhlhicufhhorhcumhhorhgvucguvghtrghilhhsuceofhgpphgvnhhnrgesrghlihgtvgdrihhtqeenucggtffrrghtthgvrhhnpeehjeetgefhleetiedtkeelfffgjeeugeegleekueffgfegtdekkeeifedvvdffteenucfkphepudejiedrvddvjedrvdegvddrudeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopegrlhhitggvrdhithdpihhnvghtpedujeeirddvvdejrddvgedvrdduledtpdhmrghilhhfrhhomhepfhgpphgvnhhnrgesrghlihgtvgdrihhtpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqshgrmhhsuhhnghdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-RazorGate-Vade-Verdict: clean 60
X-RazorGate-Vade-Classification: clean
Received: from alice.it (176.227.242.190) by mta-out-03.alice.it (5.8.807.04) (authenticated as f_penna@alice.it)
        id 623C9D0500EBCB40 for linux-samsung-soc@vger.kernel.org; Sun, 3 Apr 2022 05:00:22 +0200
Reply-To: dougfield20@inbox.lv
From:   We have an offer to invest in your country under a
         joint venture partnership please reply for more
         details <f_penna@alice.it>
To:     linux-samsung-soc@vger.kernel.org
Date:   02 Apr 2022 20:00:20 -0700
Message-ID: <20220402200020.E1B0327B4711466B@alice.it>
MIME-Version: 1.0
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,BODY_EMPTY,
        DKIM_INVALID,DKIM_SIGNED,EMPTY_MESSAGE,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,MISSING_SUBJECT,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_BL,RCVD_IN_MSPIKE_L3,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [217.169.118.9 listed in list.dnswl.org]
        *  0.0 RCVD_IN_MSPIKE_L3 RBL: Low reputation (-3)
        *      [217.169.118.9 listed in bl.mailspike.net]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5051]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [f_penna[at]alice.it]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dougfield20[at]inbox.lv]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  2.3 EMPTY_MESSAGE Message appears to have no textual parts and no
        *      Subject: text
        *  1.8 MISSING_SUBJECT Missing Subject: header
        *  0.1 DKIM_INVALID DKIM or DK signature exists, but is not valid
        *  0.0 RCVD_IN_MSPIKE_BL Mailspike blacklisted
        *  0.0 BODY_EMPTY No body text in message
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

