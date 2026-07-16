Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A6A33DEDD;
	Thu, 16 Jul 2026 20:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784232749; cv=none; b=qgls6qTHNnhn/h4CC2fjZNIoSgjxH90nON0ETxj1aVD2uxzHFej4Mt1hwuJCHATghheAmPBYHtnh/9JqdYltBvNdK43nzLmpD21jBJJkNyzFdg4CF5UsHuTNSQaSjqq2Hh2hW9qWmY3Y0XBTrggYXz1Hq+MW18Mp8Dd17Gg3ulg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784232749; c=relaxed/simple;
	bh=m6pjdx7OA069UsE2K1J8diZEGkyScJTt3v3cFwYvzM4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=tfN8P6n5gjrje7yZj3UcUb0kEtaK5pQ/x7C3j7IIUn0QwsTASL81Sgb8dZcUs+JL9ZRuTD0d9Pb6WdyL35fjJxmJKcgas3u0X3k2Dhr9BkKniyLt88F0gUx3dWE48lD10Uq8GOqOaanCDEy5y6CPg77fkOBSjarsg+yoasSFy7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/f+cg73; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/f+cg73"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAF601F000E9;
	Thu, 16 Jul 2026 20:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784232748;
	bh=LmZlSmryCzbYZ7/Nda6gMZ4mc8FirUvt+n7RcFZr7eI=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=Y/f+cg73nqhxWGAma0/oF9KuibA5NYDDQrSSLlNOKwbUEVxd7EVW30aofF1IGaDTR
	 CO2cB9BKTuTBTxNMuniK3TD5/oophRrkKj9SuOr+Q8MHXzjPsC1ANamcKNEeXJ4JqW
	 SVpMEDWCiivG/1Esy20O3IdFOcISOtAo+F1Eh7w1d1S6FdqnsIcd4Wx/O4xNr8VBvT
	 cfuCnx8tceNJeZX40YmHYZyyrgJ0Q1j7Jz1U/5TDpFik34u2WEXu4hp19iryU7p90S
	 L6u9gIKgp3idagqOS6ClJbBdb2tCbBx57THxvZX9FQRYaDaUauN+/yNsRkx6TyH1TP
	 8iXwPSQXwxIEA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 22:12:25 +0200
Message-Id: <DK09PZKT2YGE.37D097G2LLYTH@kernel.org>
Cc: <gregkh@linuxfoundation.org>, <mcgrof@kernel.org>, <rafael@kernel.org>,
 <russ.weight@linux.dev>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>
To: "Corentin LABBE" <clabbe@baylibre.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] firmware: maintain a firmware list
References: <20260715131325.26099-1-clabbe@baylibre.com>
 <DJZBI1NIB539.2WG8TLYV4ZXDV@kernel.org> <alikeGzFw4XTIDpJ@Red>
In-Reply-To: <alikeGzFw4XTIDpJ@Red>

On Thu Jul 16, 2026 at 11:29 AM CEST, Corentin LABBE wrote:
> Le Wed, Jul 15, 2026 at 07:23:25PM +0200, Danilo Krummrich a =C3=A9crit :
>> (Cc: driver-core; please make sure to Cc all relevant mailing lists)
>>=20
>> On Wed Jul 15, 2026 at 3:13 PM CEST, Corentin Labbe wrote:
>> > From: Corentin LABBE <clabbe@baylibre.com>
>> >
>> > Checking if some firmware is missing need to check dmesg for error mes=
sage,
>> > and on some machine this information could be lost since dmesg uses a =
ring buffer.
>> > Having the list of all firmware requests is useful in many situations,
>> > like selecting the minimal list when doing some buildroot config
>> > or reducing the size of linux-firmware on gentoo via saveconfig.
>>=20
>> The proposed implementation aside, I don't see why this needs a new kern=
el
>> interface.
>
> Hello
>
> You miss the point that I propose an easy way to know.
> All your proposals imply scripting, grepping in difference place.
> I propose a unique easy way to know the list, without any requirement

No, I get that, but I think that the overhead of the proposed patch is not
justified, given that there are reasonable alternatives.

>> Untested, but something like
>>=20
>> 	kprobe_event=3Dp:fw_req,_request_firmware,name=3D+0(%si):string
>>=20
>> should work I think.
> This imply command line hacking, something I prefer to avoid, it is bette=
r when it just works without change.

Adding a kernel command line parameter seems perfectly reasonable for your
use-case. We could maybe consider a dedicated TRACE_EVENT for firmware bein=
g
loaded if this turns out to be a thing people commonly want to have, but fo=
r now
it seems a kprobe_event works for your case.
