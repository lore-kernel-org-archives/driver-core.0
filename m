Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA4510785;
	Fri,  3 Jul 2026 13:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086698; cv=none; b=ormoXtnnnrpG2kg9c53kqDZLrjPcZpENPskkfANGXcjWZhYPcuhlwdUNQhK0NkEwdFGxEivyGcj+NMWuUVaCy9ZTj5Ks1RHl27Jd6DAyL37jCnciix4UVoC/jF+vPngallph39Agw8TRailbdKeURugw+EEibjPZygjlqI7WSpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086698; c=relaxed/simple;
	bh=q4YgE8n/2GZF6V6DbBSZovELpum/b5iUEBOL9F/qNcI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=qalCZCipUIFTHCReGw3RqXLAusdtimNwsgIrbO0NN6F62pdyi8ZmTxI3676iR4ZT+26ZC96kVP8a17jWQj/MO35rcukpuJg3RpJWnUTP+ZQbn5jDz21ANbhusndaXdV72nRp0IzZu9GRu0ACcyQAeTTrR1UGPD4C548hvwyGgSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OxSlNEHz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OxSlNEHz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 969901F000E9;
	Fri,  3 Jul 2026 13:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783086697;
	bh=q4YgE8n/2GZF6V6DbBSZovELpum/b5iUEBOL9F/qNcI=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=OxSlNEHz/jRglacIUODx1GllP4aNbr7+qUWg7gLvub1PLmyMo80nIH5JtTAARKXwc
	 WOKUHOQRyHP78K5OWJegvaE39Awb7ixv6BZyiI9Hl8/PDWks7bo8+ipD5Pm7qvo0k8
	 gV91Ap1fs0LFrS6ABjM9Ym3/zOm3NoP1jqD85OfoRqHhAr9/Acf4vIuFeLCxdIbjPa
	 +w+3yZs9e4w9hA+HA0s/n78KpBgD4D5STDM2LVF55+7t8F4pgtgo898IlmbLKk0K8d
	 pKVToFVMcDCN2g8rflAXP7KbUOQRaZWBqovzgQ3gXHRzUe4NBO2ahd+jOP1fx3/FUz
	 THQ8OTayfiOqA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 15:51:33 +0200
Message-Id: <DJOZHAHWTU68.18ILU1LSTEQJC@kernel.org>
Subject: Re: [PATCH v3 1/7] rust: firmware: add request_into_buf()
Cc: "John Hubbard" <jhubbard@nvidia.com>, "alvin.sun@linux.dev"
 <alvin.sun@linux.dev>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "Zhi
 Wang" <zhiw@nvidia.com>, "mcgrof@kernel.org" <mcgrof@kernel.org>,
 "gary@garyguo.net" <gary@garyguo.net>, "russ.weight@linux.dev"
 <russ.weight@linux.dev>, "driver-core@lists.linux.dev"
 <driver-core@lists.linux.dev>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
 <20260702192712.3450652-2-ttabi@nvidia.com>
 <a87b3b29-3dcf-425c-b700-da957400daea@linux.dev>
 <5515b3a5d405dba4d04c628b435065b5e3b631bc.camel@nvidia.com>
In-Reply-To: <5515b3a5d405dba4d04c628b435065b5e3b631bc.camel@nvidia.com>

On Fri Jul 3, 2026 at 5:06 AM CEST, Timur Tabi wrote:
> I would have to add it to the list of imports.

That's fine, please do. While at it, you can also remove the explicit impor=
ts
that are then covered by the prelude.

Thanks,
Danilo
