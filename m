Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F4B59E329;
	Tue,  8 Sep 2026 19:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894748; cv=none; b=fSYKE7ljOTw4KhvqiZse+eQdjxn1LniRmYmCCSSmVvxTNhJQMGRdh8Gdg2vmL9UGXyUmCV0sRReVJh1NdC4HupXmuE8FtPlj/absPldgutYGtazAHHfi33Pd/BrPYy1+qXDjzEJTqeodjTPU8dSO+dXWNRIcS3JyoJF3y7vx4ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894748; c=relaxed/simple;
	bh=ULls6K+xR5lzJPgZ9y4UmQ0D9dWtfXndJ0WoQmI+mw8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=tS9EaqzXLwgLzowc8EuUfD2fH/ev337Py/KuuNtuN2l2AO801htLUu30e3BOFzx5zvbTHCN4Fjh19H9QU8ajTABswRAME551HdM//XkP7PRc+xuEMK8zLN9nOUlL+kwf28Ew8dg79/Cyc9rWo6f1izKnEeCAKVuCzdtoHZUxYzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPZzytxP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPZzytxP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F891F00A3A;
	Tue,  8 Sep 2026 19:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788894747;
	bh=Sc3j++4oCDXE0SEDuSqnjPSNVryhLDaFkRZ3FLcPr+k=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=iPZzytxPWIsH5sLkmZZ6SDXgspt7JFar6+cGUCLMRVtF8mI12NaJOtshTlQaQWp8i
	 imlrbo4zBEovqhj79WM4wDa4FWfXv7dvCkoDLTx1RmRJR1pSrTXOW8MwU6pbgVFytk
	 nCxsBRTv2x78Xjy2XZzy8ctNG7UmXX/h5TAu6z785DJxCenZ5WlIvH4E5/Hit899zx
	 12Vp7pjqPeu+VQX3cH8LIv1K/ewa7xiQ9OShWmD0LoFrW7HR78ohX45xo8XNGOihXr
	 RAo0R+r/QyctnMkq3bhst+nS6bz7abjP0tSCkOQCBjn9PQc/FSKbGqzdU6uQ3qzFDp
	 g7mIDW5Ss0j9g==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 21:12:25 +0200
Message-Id: <DLA69GVF58GV.21CRMD4SG15P9@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 2/3] w1: move slave uevent into w1_slave_device_type
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
References: <20260820225430.1847356-1-dakr@kernel.org>
 <20260820225430.1847356-2-dakr@kernel.org>
 <3d212544-d955-41c6-8589-6c3d6c6f7b75@kernel.org>
In-Reply-To: <3d212544-d955-41c6-8589-6c3d6c6f7b75@kernel.org>

On Tue Sep 8, 2026 at 4:54 PM CEST, Krzysztof Kozlowski wrote:
> On 21/08/2026 00:54, Danilo Krummrich wrote:
>> The bus-level w1_uevent() only ever added uevent variables (W1_FID,
>> W1_SLAVE_ID) for slave devices.
>
> I don't follow why only for slave. I see the w1_uevent() being part of
> w1_master_driver and so on as well.

The only thing w1_uevent() does for w1_master_driver is printing

	dev_dbg(dev, "Hotplug event for %s %s, bus_id=3D%s.\n",
		event_owner, name, dev_name(dev));

W1_FID and W1_SLAVE_ID are only ever set for slave drivers.

I think the dev_dbg() wasn't overly useful as uevents can be read from user=
space
anyway, which is why I dropped it.

>> Move the slave uevent logic into w1_slave_device_type.uevent where it
>> naturally belongs and remove the bus-level uevent callback entirely.
>>=20
>> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>> ---
>> Compile-tested only, no hardware available.
>>=20
>> I think the dev_dbg() stuff wasn't really  useful, so I dropped it.
>> ---
>
>
> Best regards,
> Krzysztof

