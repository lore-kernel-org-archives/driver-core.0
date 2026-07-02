Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85E02517A5;
	Thu,  2 Jul 2026 03:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782962220; cv=none; b=XHw5uVCbVDosZbIhoVdRWeR7yh/entLBbFQxAmyXh000lYrdzpIdc6Frvy2M65UrhJujwQDx8YWpXYpQm3Ur+ixV/Wbr3RQWAXOc4Fq4PKHzRaK5vjqpd0zjo/9L79UOIoUpVU0rOxZS88a1y/TsRfZHRDIMpT7JFhXNJLi0jOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782962220; c=relaxed/simple;
	bh=TAr24KJIOOtoBaePpxrV4GHh02aFO0nUIw+b5wz6tL4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Rcx3SUubo+oioiHG3oi3y61pzNLh2FJXnyAWTPh90qzdq7kTP1mIhLAXnme0eVVY2f1HzmweBXZieapFXtmOWJxIwu3+pJx/D0WKl3OdEDd6Ry9FAYBNDDPPTGbfZoWeiZA/BtjctNdBYJlLV/Df3dpBGwaF11BUgcXfxUE+DU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dUUvMdKs; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dUUvMdKs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=7pG+7Glmvw0v8Vt8wEP7MykzGM9uzRtdS/bCEt7sU8M=; b=dUUvMdKsQtT3DlykCV6SI2dYKH
	+MH3y57/XJ2+GgymaoZKDa8o3nGcdZoM8SoKsc8BPCIuYCf8CKPVICFICl921VO4yxMmc8PWcgbYW
	rtM9q7MEBiT1Tu3veDeOOWDvb+HDPdLpQihy0iInNkzMwxLDmK5bB9ycrVBw19vDV1H5tYiHtlIN1
	Kfi0QawJNj1pHfj6yDsZPVTdv1SnKsIdDsdI7BrlMSxxUdYASwUxHvrkURQVl/xZU3FLvqGeAbMrD
	T7z7/iClAe79nCMozGy/gNuSEmuy/Npl6qTti56JlCJeu2NysUs3GxefxA0y6aLW9vOduWQMNC40b
	IgtRVgDQ==;
Received: from [129.95.232.135] (helo=ehlo.thunderbird.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7v2-00000007mE9-0syZ;
	Thu, 02 Jul 2026 03:16:52 +0000
Date: Wed, 01 Jul 2026 20:16:47 -0700
From: Randy Dunlap <rdunlap@infradead.org>
To: Syed Nayyar Waris <syednwaris@gmail.com>, wbg@kernel.org
CC: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 syednwaris@gmail.com
Subject: Re: [PATCH v2] isa: refactor code to remove nested blocks
User-Agent: K-9 Mail for Android
In-Reply-To: <20260701205857.GA4113@syednwaris>
References: <20260701205857.GA4113@syednwaris>
Message-ID: <F5FBFA36-6E6A-47C5-94A4-084240540D5E@infradead.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 1, 2026 1:58:57 PM PDT, Syed Nayyar Waris <syednwaris@gmail=2Ecom> =
wrote:
>Remove nested blocks in isa_bus_init()=2E This will make the module
>easy-to-understand and make the code clearer=2E
>Previous discussion regarding this change can be found
>at below link:
>https://lore=2Ekernel=2Eorg/all/20260504063518=2E515620-1-wbg@kernel=2Eor=
g/
>
>Acked-by: William Breathitt Gray <wbg@kernel=2Eorg>
>Suggested-by: William Breathitt Gray <wbg@kernel=2Eorg>
>Signed-off-by: Syed Nayyar Waris <syednwaris@gmail=2Ecom>

LGTM=2E Thanks=2E=20
Acked-by: Randy Dunlap <rdunlap@infradead=2Eorg>


>---
>Changes in v2:
> - Make the patch description more comprehensive and thorough=20
>   in its explanation
>---
> drivers/base/isa=2Ec | 16 +++++++++-------
> 1 file changed, 9 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/base/isa=2Ec b/drivers/base/isa=2Ec
>index 5887e4211f80=2E=2E4e9f68080f39 100644
>--- a/drivers/base/isa=2Ec
>+++ b/drivers/base/isa=2Ec
>@@ -166,14 +166,16 @@ static int __init isa_bus_init(void)
> 	int error;
>=20
> 	error =3D bus_register(&isa_bus_type);
>-	if (!error) {
>-		isa_bus =3D root_device_register("isa");
>-		if (IS_ERR(isa_bus)) {
>-			error =3D PTR_ERR(isa_bus);
>-			bus_unregister(&isa_bus_type);
>-		}
>+	if (error)
>+		return error;
>+
>+	isa_bus =3D root_device_register("isa");
>+	if (IS_ERR(isa_bus)) {
>+		bus_unregister(&isa_bus_type);
>+		return PTR_ERR(isa_bus);
> 	}
>-	return error;
>+
>+	return 0;
> }
>=20
> postcore_initcall(isa_bus_init);


~Randy
