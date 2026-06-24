Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68D13016F5
	for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 17:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782323537; cv=none; b=j63j2/BIOXJRg4tEONZwGnPEf/dDiZ8moj+MLX0tFV9KL51BSA+HGFltiePDVQkdL4jnCL4NMBW/L75tWADQ4oxheMdMoYwcz7/+5bBq3fMk0flnD56WLdyweTHE0Bpw5j7XHYzDUnHr6eBU+ihjzN4Uz14XSXklwAK0RrvE6ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782323537; c=relaxed/simple;
	bh=/lP50G/7lToeuzIIeXjWycQzPYAUEW9OU7QZ6Po6bmY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aZfZysKeBpoFboJs59IMe776iDtkrBhiz/5wP5gIjme+pP5LEw5+2rod25RoF+30/ByUuhj0hwC7zkQ7jJnK6KiPzJi6oEb1UZ8Pe9cKyYhUXaGfnDvgXoti2RvOwpFx7ojvG0r2Djz3rBt+NqwF/7ouXmQsRud2pqBrgBqEqbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf11.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 59CB98DD74;
	Wed, 24 Jun 2026 17:52:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf11.hostedemail.com (Postfix) with ESMTPA id 16BA32002F;
	Wed, 24 Jun 2026 17:52:12 +0000 (UTC)
Message-ID: <a1f52c93e39c5bb66ab6cbb4ae778513ea6b3c9c.camel@perches.com>
Subject: Re: [PATCH] coccinelle: Add devm_kmalloc_objs conversion script
From: Joe Perches <joe@perches.com>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Kees
 Cook <kees@kernel.org>, driver-core@lists.linux.dev, Nicolas Palix
 <nicolas.palix@imag.fr>, 	cocci@inria.fr
Date: Wed, 24 Jun 2026 10:52:12 -0700
In-Reply-To: <dc6cfcc-4ec4-8b87-19c3-974818448b8c@inria.fr>
References: 
	<eed0c57a2c897e34d411229c3de41c5402791894.1781575297.git.joe@perches.com>
		 <50755b746bb30bea3989db9c1f262d5257e8ee1e.camel@perches.com>
	 <dc6cfcc-4ec4-8b87-19c3-974818448b8c@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 16BA32002F
X-Stat-Signature: n7aqfjrp57rsuqppezkyz87tggre9nyz
X-Rspamd-Server: rspamout07
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+TAHcngrvTA1oeAB1bRg0ISyqcUTeffx4=
X-HE-Tag: 1782323532-769865
X-HE-Meta: U2FsdGVkX18VaSv3AagFJuYcb4tt/d+jcmeWDJy+uZaDYsQocT/f5nm2fNbPEknhh/tVwBd9k2WYGJ4aTdPOT1bmTmXb651QSXW6rjcgSpdMTeAXCyhkm1YMPLzXk3BzJXTTRc9vgfyr2kar+ZVBXghHzQKRMUjk9DF/cR0mPaRqgA+MLDW2HrbRr48lWcOKAPhS90rfD6N/scNKlRpxaUUWDw4/frw/3EByjZGsSfkOXY8l1keAMfWZMFGgZNQYOsurWnRLLdWTcfDplhIhVM2qEFB+uZVKWWpsu8it31/sLjz+NSgxeVSF0cYqtfsn

On Wed, 2026-06-24 at 19:25 +0200, Julia Lawall wrote:
> On Wed, 24 Jun 2026, Joe Perches wrote:
> > On Mon, 2026-06-15 at 19:10 -0700, Joe Perches wrote:
> > > Like commit bdc5071d7f7b ("coccinelle: Add kmalloc_objs conversion sc=
ript")
> > > with commit 1c7bbaeed110 ("coccinelle: kmalloc_obj: Remove default GF=
P_KERNEL arg")
> > >=20
> > > Finds and converts sized devm_kmalloc-family of allocations into the =
typed
> > > devm_kmalloc_obj-family of allocations.
> >=20
> > Its been a bit.
> > Any comments or negatives about using or running this script?
> >=20
> > This script would change more than 8000 instances in more than
> > 5000 files in Linus' current master.
>=20
> I was going to try it this evening.  Are you concerned that it is too
> much?

Not really.
There were no comments and it might have been overlooked.
